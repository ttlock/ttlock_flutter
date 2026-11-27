# ttlock_flutter_demo

<!-- Callers: 开发者入口. Affected: 启动说明与文档索引. Schema: none.
     User: 「同步内容到文档中」— README 反映配置门禁与 LocalStorage. -->

TTLock **开放平台** Demo（Flutter）：OAuth 登录、云端锁/网关/凭证等数据层，以及配置门禁。

**当前进度：** P0–P3 + 锁设置补全 + 凭证循环有效期 + P4 绑锁配件 + P4.x 其他设备/网关 + P5 表计/电梯，以及另期的「去掉 `TtlockService`」「独立门磁」「设备服务器端点 + WiFi 锁配网」「水电表能力补全（2A/2B）」均已落地。P6（酒店等）未开始。
详见 [交付进度索引](docs/superpowers/00-progress.md) —— 含分期总览、导航信息架构、已知缺口，以及**未提交的在途改动与当前红灯状态**。

## 快速开始

本目录是 `ttlock_flutter` 插件的包内示例，位于 monorepo 的 `ttlock_flutter/example`。本地 path 依赖按该布局解析（见 `pubspec.yaml` / `pubspec_overrides.yaml`）。

```bash
# 在 monorepo 内
cd ttlock_flutter/example
fvm flutter pub get
fvm flutter run
```

### 首次运行：Client ID / Secret

1. 若 `assets/config.json` **未**预填 `clientId`/`clientSecret`，启动会进入 **开放平台配置** 页；保存后进入登录页。
2. 也可在登录页点「开放平台配置」修改；「我的」内同样可进配置。
3. 配置与登录会话均缓存在本机（`LocalStorage` / SharedPreferences）。

`config.json` 示例（勿将真实密钥提交到公共仓库）：

```json
{
  "clientId": "",
  "clientSecret": "",
  "site": "cn"
}
```

站点：`cn` → 中国站；其它值按 `AppSite` 解析境外站。

## 文档

| 文档 | 内容 |
|------|------|
| [SDK 测试用例](docs/qa/sdk-api-testcases.md) · [表格 CSV](docs/qa/sdk-api-testcases.csv) | **给测试同学：用 Demo 验证 SDK（Android / iOS / 鸿蒙）** |
| [交付进度索引](docs/superpowers/00-progress.md) | **as-built 分期与 Feature 成熟度（优先看这里）** |
| [开放平台 Demo 设计](docs/superpowers/specs/2026-08-25-ttlock-open-platform-demo-design.md) | 分期、目录、鉴权与错误契约 |
| [配置门禁 + 本地存储](docs/superpowers/specs/2026-08-26-auth-config-gate-design.md) | 强制配置向导、OAuth 空 token、LocalStorage |
| [锁设置补全](docs/superpowers/specs/2026-08-31-lock-settings-completion-design.md) | P2.5 纯锁配置（音量/开关族/常开等） |
| [凭证循环有效期](docs/superpowers/specs/2026-09-03-credential-cyclic-config-design.md) | cyclicConfig 共享 UI 与各凭证接线 |
| [P4 绑锁配件](docs/superpowers/specs/2026-09-04-lock-accessories-p4-design.md) | 锁设置配件区：遥控 / 键盘 / 门磁 |
| [P4.x 其他设备 + P5 表计/电梯](docs/superpowers/plans/2026-09-05-ttlock-p4x-other-devices-p5-meters-lift.md) | 「其他设备」Tab；网关/水表/电表/电梯接入 |
| [去掉 TtlockService](docs/superpowers/specs/2026-09-08-remove-ttlock-service-design.md) | 删 Service 与 `Ttlock*` 平行类型，业务直调 `TTLock.*` |
| [独立门磁](docs/superpowers/specs/2026-09-09-standalone-door-sensor-design.md) | 「其他设备」第 4 Tab：BLE 配网 + 云端管理 |
| [设备服务器端点与 WiFi 锁配网](docs/superpowers/specs/2026-09-10-device-server-endpoint-design.md) | 站点化设备端点表；WiFi 锁配网 |
| [水电表能力补全](docs/superpowers/specs/2026-09-11-meter-detail-capabilities-design.md) · [计划 2A](docs/superpowers/plans/2026-09-12-meter-capabilities-pages-2a.md) · [计划 2B](docs/superpowers/plans/2026-09-12-meter-capabilities-pages-2b.md) | 水/电表详情、设置、4G、操作与用量记录 |
| [架构约定](docs/flutter-architecture.md) | Feature-first / Riverpod / TaskEither |
| [网络与路由](docs/flutter-networking-routing.md) | Dio、AppException、GoRouter |
| [Riverpod / Freezed](docs/flutter-riverpod-freezed.md) | Provider 形态与建模约定 |

## 常用命令

```bash
fvm flutter analyze
fvm flutter test
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter gen-l10n
```
