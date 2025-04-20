const inquirer = require("inquirer");
const { execSync } = require("child_process");
const fs = require("fs");

function extractLatestChangelogBlock(filePath) {
    const content = fs.readFileSync(filePath, "utf-8");

    const match = content.match(/^[-]{5,}\r?\n([\s\S]*?)(?=\r?\n[-]{5,})/m);
    if (!match) {
        throw new Error("❌ 无法在 changelog.txt 中提取版本记录");
    }

    return match[1].trim();
}

function appendToChangelogMd(version, date, rawTextBlock) {
    const changelogMdPath = "CHANGELOG.md";

    // 如果不存在就初始化
    if (!fs.existsSync(changelogMdPath)) {
        fs.writeFileSync(changelogMdPath, "# Changelog\n\n");
    }

    const mdText = fs.readFileSync(changelogMdPath, "utf-8");

    // 格式化 rawTextBlock 为 Markdown 样式
    const lines = rawTextBlock
        .split("\n")
        .map((line) => line.replace(/^  /, "").replace(/^- /, "-")) // 清理缩进
        .filter((line) => line.trim() !== ""); // 去掉空行

    const formattedBlock = [
        `## [${version}] - ${date}`,
        ...lines.slice(2), // 去掉前两行（Version 和 Date），我们已经有了
    ].join("\n");

    // 插入到 # Changelog 下方
    const updated = mdText.replace(
        /^# Changelog\s*/,
        `# Changelog\n\n${formattedBlock}\n\n`
    );

    fs.writeFileSync(changelogMdPath, updated);
}

function extractLatestChangelogBlockFromMd(filePath) {
    const content = fs.readFileSync(filePath, "utf-8");

    // 使用正则表达式从 md 文件中提取最新的版本块
    const match = content.match(
        /## \[(\d+\.\d+\.\d+)\] - (\d{4}-\d{2}-\d{2})\s*([\s\S]*?)(?=\n## \[|\n$)/m
    );
    if (!match) {
        throw new Error("❌ 无法在 CHANGELOG.md 中提取版本记录");
    }

    const version = match[1]; // 提取版本号
    const date = match[2]; // 提取日期
    const changelogText = match[3].trim(); // 提取变更内容

    // 返回带有 # Changelog 和提取的版本块
    return `# Changelog\n\n## [${version}] - ${date}\nChanges:\n${changelogText}\n\nAll notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.\n\n### [${version}](https://github.com/geekiechen/chens-tweak-mod/compare/v${version}...v${version}) (${date})`;
}

(async () => {
    const prompt = inquirer.createPromptModule();
    const { type } = await prompt([
        {
            type: "list",
            name: "type",
            message: "请选择发布类型：",
            choices: [
                { name: "🔧 Patch - 修复或小调整", value: "patch" },
                { name: "✨ Minor - 添加功能（向下兼容）", value: "minor" },
                {
                    name: "💥 Major - 破坏性变更（不兼容旧存档）",
                    value: "major",
                },
            ],
        },
    ]);

    try {
        execSync(`git add . && git commit -m "chore: release prep"`, {
            stdio: "inherit",
        });

        execSync(`npx standard-version --release-as ${type}`, {
            stdio: "inherit",
        });

        const version = JSON.parse(
            fs.readFileSync("package.json", "utf8")
        ).version;

        // 🟡 提取 changelog.txt 中最新块
        const block = extractLatestChangelogBlock("changelog.txt");

        // 🟢 提取 Version 和 Date 行（用于 md 标题）
        const [versionLine, dateLine] = block.split("\n");
        const versionMatch = versionLine.match(/Version:\s*(.+)/);
        const dateMatch = dateLine.match(/Date:\s*(.+)/);

        if (!versionMatch || !dateMatch) throw new Error("无法解析版本或日期");

        const v = versionMatch[1].trim();
        const d = dateMatch[1].trim();

        // ✅ 同步写入 CHANGELOG.md
        appendToChangelogMd(v, d, block);

        // 直接在命令中传递 --notes-file 的内容
        execSync(`git push origin main --follow-tags`, {
            stdio: "inherit",
        });

        // 🟡 从 CHANGELOG.md 中提取最新的版本块
        const latestChangelog =
            extractLatestChangelogBlockFromMd("CHANGELOG.md");

        // ✅ 创建 GitHub Release，并直接从 CHANGELOG.md 中提取最新的版本块作为 --notes-file
        execSync(
            `gh release create v${version} --title "v${version}" --notes '${latestChangelog}'`,
            {
                stdio: "inherit",
            }
        );
    } catch (e) {
        console.error("❌ 发布过程中出错：", e.message);
    }
})();
