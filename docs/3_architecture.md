# 3. 系统架构：AI 生态全景结构化图谱

该系统被划分为五个逻辑层级，构成了完整的 AI 生态交互关系图谱。

## 1. 治理与决策层 (Governance & Decision)
*   **LLM (大脑)**: 核心推理引擎。负责理解指令、规划行动步骤并生成回复。
*   **Agent (智能体)**: 实体外壳（经理/员工）。利用 LLM 的推理能力，基于目标意识和自主决策权指挥系统运行。
*   **LangSmith (评估/外部信息)**: 质检员。负责监控、评估和调试 Agent 与 LLM 的交互质量，确保输出可靠性。

## 2. 知识与记忆层 (Knowledge & Memory)
*   **Memory (记忆)**:
    *   **短期记忆**: 记录当前对话上下文。
    *   **长期记忆**: 存储长期知识、用户偏好，为 Agent 提供决策背景。

## 3. 连接与协议层 (Connectivity & Protocol)
*   **MCP (协议)**: Model Context Protocol (Anthropic)，充当“统一插座”。允许 GitHub、Google Drive 等不同数据源以统一格式接入 AI。
*   **Connectors / Links (连接器)**: 具体连接管道。在 MCP 标准下打通特定外部应用程序与 AI 系统。

## 4. 执行与技能层 (Execution & Skills)
*   **Tools (工具)**: 原子化能力（如搜索、计算器），被调用的基础功能。
*   **Skill (技能)**: 基于专家经验的复合能力或工作流。多个工具的有机协作（例如“周报撰写”技能 = 读取日志 + 汇总 + 翻译）。
*   **Cloud Browser / Sandboxed Env (运行环境)**: Agent 执行任务的安全隔离区（沙箱），防止对主系统造成破坏。

## 5. 经济与结算层 (Economy)
*   **x402 (Payment/Economy)**: 基于 HTTP 402 的支付协议。用于处理 Agent 之间的自动支付和价值交换（当调用付费工具或 API 时）。
