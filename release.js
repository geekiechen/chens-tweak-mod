const inquirer = require("inquirer");
const { execSync } = require("child_process");
const fs = require("fs");

function extractLatestChangelogBlock(filePath) {
    const content = fs.readFileSync(filePath, "utf-8");

    // 使用正则提取 changelog.txt 中的最新更新日志块（包括 Version, Date 和 Changes）
    const match = content.match(/^[-]{5,}\r?\n([\s\S]*?)(?=\r?\n[-]{5,})/m);
    if (!match) {
        throw new Error("❌ 无法在 changelog.txt 中提取版本记录");
    }

    const extractedBlock = match[1].trim();
    console.log("提取的更新日志块：", extractedBlock); // 打印提取的更新日志块
    return extractedBlock;
}

function appendToChangelogMd(version, date, rawTextBlock) {
    const changelogMdPath = "CHANGELOG.md";

    // 如果不存在就初始化
    if (!fs.existsSync(changelogMdPath)) {
        fs.writeFileSync(changelogMdPath, "# Changelog\n\n");
    }

    const mdText = fs.readFileSync(changelogMdPath, "utf-8");

    // 格式化 rawTextBlock 为 Markdown 样式
    const formattedBlock = [
        `## [${version}] - ${date}`,
        `Version: ${version}`,
        `Date: ${date}`,
        "  Changes:",
        rawTextBlock
            .split("\n")
            .map((line) => line.trim()) // 去除每一行的多余空白
            .filter((line) => line) // 过滤掉空行
            .map((line) => `    - ${line}`) // 生成符合 Markdown 格式的项目
            .join("\n"),
        `All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.`,
        `### [${version}](https://github.com/geekiechen/chens-tweak-mod/compare/v${version}...v${version}) (${date})`,
    ].join("\n");

    // 插入到 # Changelog 下方
    const updated = mdText.replace(
        /^# Changelog\s*/m,
        `# Changelog\n\n${formattedBlock}\n\n`
    );

    fs.writeFileSync(changelogMdPath, updated);
}

function extractFromChangelogMd() {
    const changelogMdPath = "CHANGELOG.md";
    const mdContent = fs.readFileSync(changelogMdPath, "utf-8");

    // 从 CHANGELOG.md 中提取最新的更新日志块
    const match = mdContent.match(
        /^## \[([^\]]+)] - ([^\n]+)\s*([\s\S]+?)\n\n/m
    );
    if (!match) {
        throw new Error("❌ 无法从 CHANGELOG.md 提取最新的更新日志");
    }

    const version = match[1].trim();
    const date = match[2].trim();
    const changes = match[3].trim();

    console.log("从 CHANGELOG.md 提取的版本：", version);
    console.log("从 CHANGELOG.md 提取的日期：", date);
    console.log("从 CHANGELOG.md 提取的变更内容：", changes);

    return { version, date, changes };
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
        // 执行 Git 提交准备操作
        execSync('git add . && git commit -m "chore: release prep"', {
            stdio: "inherit",
        });

        // 使用 standard-version 生成版本和变更日志
        execSync(`npx standard-version --release-as ${type}`, {
            stdio: "inherit",
        });

        const version = JSON.parse(
            fs.readFileSync("package.json", "utf8")
        ).version;

        // 提取 changelog.txt 中最新的更新日志块
        const block = extractLatestChangelogBlock("changelog.txt");

        // 从提取的块中获取版本和日期
        const [versionLine, dateLine, ...changes] = block
            .split("\n")
            .map((line) => line.trim()); // 去除多余的空白和缩进
        const versionMatch = versionLine.match(/Version:\s*(.+)/);
        const dateMatch = dateLine.match(/Date:\s*(.+)/);

        if (!versionMatch || !dateMatch) throw new Error("无法解析版本或日期");

        const v = versionMatch[1].trim();
        const d = dateMatch[1].trim();

        // 同步更新到 CHANGELOG.md 文件
        appendToChangelogMd(v, d, block);

        // 从 CHANGELOG.md 中提取最新的版本信息和变更内容
        const {
            version: mdVersion,
            date: mdDate,
            changes: mdChanges,
        } = extractFromChangelogMd();

        // 推送版本到 GitHub
        execSync("git push origin main --follow-tags", { stdio: "inherit" });

        // 创建 GitHub Release
        execSync(
            `gh release create v${version} --title "v${version}" --notes "Version: ${mdVersion}\nDate: ${mdDate}\n\n${mdChanges}"`,
            { stdio: "inherit" }
        );
    } catch (e) {
        console.error("❌ 发布过程中出错：", e.message);
    }
})();
