---
title: "siyuan-sisyphus — 思源笔记的 MCP 服务器和 CLI 工具"
date: 2025-05-19
draft: false
tags: ["思源笔记", "MCP", "TypeScript", "CLI"]
category: "代码"
---

## 这是什么

一个思源笔记插件，提供两种对外接口：
- **MCP Server**：让 AI agent 通过标准协议操作思源笔记
- **CLI 工具**：在终端里直接读写思源内容

两者共享同一套笔记读写能力，覆盖 11 个操作类别（notebook、document、block、数据库、文件、搜索、标签、系统等）。

我是贡献者之一。

## 和 siyuan-agent-bridge 的区别

- agent-bridge：轻量 Python 层，5 个工具，设计哲学是"像编程工具一样简单"
- sisyphus：功能全面的插件 + CLI，11 个工具组，覆盖思源全部能力，内置权限管理面板

两者可以同时接入，互补使用。

## 技术栈

TypeScript + Svelte，MIT 协议，NPM 包 `siyuan-sisyphus`

[GitHub →](https://github.com/alone-tree/siyuan-plugins-mcp-sisyphus)
