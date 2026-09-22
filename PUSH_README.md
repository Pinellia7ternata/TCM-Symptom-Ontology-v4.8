# 待推送仓库文件 — TCM-SO v4.10（2026-09-18）

本目录是为修复**投稿包合规自查报告 M2 项**而准备的仓库文件暂存区：

> M2：§Data availability 声明的文件在仓库中不存在——三个 SSSOM 映射集、
> `mapping_provenance.csv`、`clinical_normalization_results.csv`、`translation_tier_audit.csv`、
> `clinical_normalization_spotcheck_200.csv`（200-mention 双盲抽检表，本轮 M4 新增声明）。

推送后，稿件 Data availability 中声明的**每一个文件路径都能在仓库中解析**。

---

## 1. 待推送文件清单（含校验值）

| 仓库目标路径 | 字节 | 数据行数 | MD5 |
|---|---:|---:|---|
| `mappings/TCM-SO-HPO.sssom.tsv` | 66,533 | 649 | `d4d60a8a454dfe41889a7e455ab86cf3` |
| `mappings/TCM-SO-SNOMEDCT.sssom.tsv` | 87,527 | 707 | `760e64f3a9015863d0bdd35dc1c1c0b4` |
| `mappings/TCM-SO-ICD11.sssom.tsv` | 122,234 | 973 | `6476f1d3f9dbcd1d4f6a91e34b2893cb` |
| `documentation/mapping_provenance.csv` | 175 | 4 | `e4a6759aca76b2517d98bf15803db6aa` |
| `documentation/translation_tier_audit.csv` | 238 | 10 | `1fdd41adb3c268d959dbed690a457684` |
| `documentation/clinical_normalization_results.csv` | 322 | 11 | `e78133f845a679fb3442c20b92b53c23` |
| `documentation/clinical_normalization_spotcheck_200.csv` | 28,322 | 200 | `0342bbb9f92974e8beb7f47637e9a29f` |
| `documentation/clinical_normalization_spotcheck_200_scored.csv` | 38,800 | 200 | `cf2bbb42e8b739fdca8c91ba2f1b40e2` |
| `documentation/kappa_reannotation_sheet_rated.csv` | 35,000 | 421 | `63fdc61bcedc6438aba649202e89dc46` |
| `documentation/findingSite_category_conflicts.csv` | 18,198 | 318 | `613728cad5fa93f230ea8a4fe634eceb` |

机读清单：`_file_manifest.csv`（含 git blob SHA1）。

### SSSOM 映射集说明（谓词口径已确认）

三份 SSSOM 文件**已经生成完毕**，无需重新生成。谓词归属如下，与稿件 §Cross-standard
mapping 完全一致（合计 2,329 = 522 exact + 1,807 close）：

| 文件 | 行数 | `skos:exactMatch` | `skos:closeMatch` |
|---|---:|---:|---:|
| `TCM-SO-HPO.sssom.tsv` | 649 | 167 | 482 |
| `TCM-SO-SNOMEDCT.sssom.tsv` | 707 | 259 | 448 |
| `TCM-SO-ICD11.sssom.tsv` | 973 | 96 | 877 |
| **合计** | **2,329** | **522** | **1,807** |

SSSOM 表头为：`subject_id, subject_label, predicate_id, object_id, object_label,
mapping_justification, curation_status`。

`curation_status` 列即 M3 的解法：把双盲重标注中**未达 ≥2/3 共识**的映射标为
`under_review`，共 **78 行**（HPO 25 / SNOMED CT 11 / ICD-11 42）。78 > 抽中的 75 个
映射对，原因是少数"英文标签 + 目标码"对由多于一个 TCM-SO 类共享（抽样框架内有 47 组
此类重复、55 行冗余），该口径已在稿件与补充材料 S6.3 后明确披露。

### 关于 `findingSite_category_conflicts.csv`

远程已存在同名文件（17,875 B，SHA `4e0d6c63…`），本地版为 18,198 B
（SHA `678de064…`）。内容为同样的 318 行，字节差异**仅来自 UTF-8 BOM 与 CRLF 行尾**，
语义等价。**可选推送**（推送会统一为本地 CRLF+BOM 版本），不推也不影响声明成立。

---

## 2. 推送方式（二选一）

### 方式 A — 本机 git（推荐）

双击本目录下的 **`push_to_repo.bat`**。脚本会：

1. 把远程仓库 clone 到本目录下的 `_push/`（已存在则跳过）；
2. 覆盖复制上述 9 个文件（默认不含 findingSite，见注释；含双盲评分表 `clinical_normalization_spotcheck_200_scored.csv`）；
3. `git add` → `git commit` → `git push origin main`。

凭据提示：用户名 `Pinellia7ternata`，密码填 **Personal Access Token**（需 `repo` 权限），
不要填网页登录密码。

### 方式 B — 网页上传

打开 https://github.com/Pinellia7ternata/TCM-Symptom-Ontology-v4.8

- `mappings/` → Add file → Upload files → 上传 3 个 `.sssom.tsv`
- `documentation/` → Add file → Upload files → 上传 6 个 `.csv`（含 `clinical_normalization_spotcheck_200_scored.csv`）
- Commit message 建议：`Add SSSOM mapping sets and machine-readable supplementary tables`

（若 `documentation/` 目录尚不存在，先在仓库根目录用 "Create new file" 输入
`documentation/README.md` 即可自动建目录。）

---

## 3. 推送后请顺手完成的两件事

1. **仓库改名**：Settings → General → Repository name → 改为 `TCM-Symptom-Ontology`
   → Rename。稿件摘要的 Database URL 与 Data availability 均按**无后缀**名书写，
   改名后严格一致（GitHub 会把旧名 `-v4.8` 自动重定向，Zenodo 元数据不受影响）。
2. **仓库 description**：把 "Release v4.8" 更新为 "Release v4.10"。

---

## 4. 推送后验证清单

- [ ] `mappings/` 下可见 6 个文件（3 CSV + 3 SSSOM）
- [ ] `documentation/` 下可见上述 6–7 个 CSV（含 `clinical_normalization_spotcheck_200_scored.csv`）
- [ ] 随机打开 `mappings/TCM-SO-HPO.sssom.tsv`，确认 `curation_status` 列存在且含 25 行 `under_review`
- [ ] 访问 https://github.com/Pinellia7ternata/TCM-Symptom-Ontology 能正常打开（改名后）
- [ ] 稿件 §Data availability 中的每个路径逐一点开，确认不 404
