---
title: "siyuan-agent-bridge — 把思源笔记做成 AI 的知识库"
date: 2025-05-08
draft: false
tags: ["思源笔记", "MCP", "AI Agent", "Python"]
category: "代码"
---

## 这是什么

一个轻量级 MCP（Model Context Protocol）适配层，让 Claude Code、Codex、Cursor 等 AI agent 能安全地读取、搜索、写入思源笔记。

它不是思源插件，而是一个独立的 Python 进程，通过 MCP 协议和 AI agent 通信。

## 为什么做

思源笔记是我的知识总库——投资研究、小说创作、文章草稿、日常思考都在里面。但我用的 AI 工具读不到它。

这个 bridge 解决了三个问题：

1. **隐私安全**：不是把所有笔记暴露给 AI，而是让 AI 像人一样"打开笔记本、看目录、翻到某一页、改几个字"
2. **写入风险**：每次编辑前自动创建思源快照，改坏了可以回退
3. **上下文爆炸**：文档分段阅读，AI 不会一次读完 5 万字直接爆 token

## 怎么用

像操作文件系统一样：
- `siyuan_list` — 列出笔记本和文档树
- `siyuan_find_documents` — 搜索知识库
- `siyuan_read_document` — 分段阅读，带大纲导航
- `siyuan_edit_document` — 精确文本替换编辑
- `siyuan_create_document` — 创建新文档

## 技术栈

Python 3.11+，Apache-2.0 协议

[GitHub →](https://github.com/alone-tree/siyuan-agent-bridge)
