# TCM Symptom Ontology (TCM-SO)

A large-scale bilingual (Chinese–English) OWL 2 ontology of Traditional Chinese Medicine (TCM) symptoms, with HPO-style English definitions, a formally axiomatized clinical-semantic layer, equivalence-axiom faceted classification, etiology enrichment, and expert-confirmed alignments to HPO, SNOMED CT and ICD-11.

**Current release: v4.9 (2026-09-17)** · v4.8 archived on Zenodo: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22803650.svg)](https://doi.org/10.5281/zenodo.22803650)

## Key figures

| Metric | Count |
|---|---|
| Total classes | 1,941 |
| Symptom classes (`sx_`) | 1,758 |
| Clinical categories (`cat_`) | 31 |
| Modifier / value classes | 152 |
| Subclass axioms | 15,199 |
| Existential restrictions (`someValuesFrom`) | 15,781 |
| Object / datatype / annotation properties | 18 / 4 / 11 |
| Equivalence axioms (system finding classes) | 10 |
| Property chains | 1 (`findingSite ∘ partOf ⊑ findingSite`) |
| AllDisjointClasses groups | 5 |
| dueTo etiology annotations | 3,877 restrictions over 13 etiology classes (six evils + phlegm/static-blood/worms + emotion/diet/overstrain/trauma) |
| English labels | 100% of classes |
| English definitions (HPO style) | 1,637 / 1,758 symptoms (93.1%; 50.4% manually translated) |
| HPO / SNOMED CT / ICD-11 mappings | 649 / 707 / 973 (979 classes, 55.7%, expert-confirmed) |
| Reasoner validation (HermiT, Protégé) | 0 unsatisfiable classes |

## Design highlights

- **BFO 2.0 anchored**: symptoms under `DependentContinuant → ClinicalFinding`, disjoint from Disease and Syndrome.
- **Dual-axis (orthogonal faceted) classification**: asserted clinical-workflow categories + inferred anatomical facets via 10 equivalence axioms (`X ≡ ClinicalFinding and (findingSite some Site)`) and a property chain (`findingSite ∘ partOf ⊑ findingSite`).
- **Etiology axis (v4.9)**: each symptom carries `dueTo some Evil` restrictions derived from its authoritative definition, covering the six environmental evils (wind/cold/summer-heat/dampness/dryness/fire) and TCM-specific pathological products (phlegm, static blood, worms).
- **GO-style metadata**: `oboInOwl:id`, `hasOBONamespace`, `IAO:0000115` definitions, `hasExactSynonym`, `hasDbXref`, per-mapping typing via `skos:exactMatch` / `skos:closeMatch`.
- **Bilingual definition engineering**: tiered translation pipeline (T_A_refined 886 expert-translated; T_B_high 515 curated MT ≥70% coverage; T_A_full 236 spot-checked MT; none 121).

## Repository layout

```
ontology/    TCM_Symptom_Ontology_v4.9.owl (latest), TCM_Symptom_Ontology_v4.8.owl
mappings/    HPO_mapping.csv, SNOMEDCT_mapping.csv, ICD11_mapping.csv
documentation/  findingSite_category_conflicts.csv (dual-axis classification audit)
LICENSE      CC-BY 4.0
CITATION.cff Machine-readable citation metadata
```

## Usage

Open the latest OWL file in `ontology/` with Protégé (≥5.5) and run the HermiT reasoner: classification completes in ~10–15 s with zero unsatisfiable classes. Mapping CSVs list `symptom_localname, symptom_zh, symptom_en, target code, target term, mapType (exact/close)`.

## License

[CC-BY 4.0](LICENSE). Please cite the release as given in [CITATION.cff](CITATION.cff) or via the Zenodo DOI: [10.5281/zenodo.22803650](https://doi.org/10.5281/zenodo.22803650).

## Contact

Lei Lei (leilei@mail.cintcm.ac.cn), Zheji Han (hanzheji0410@163.com), Institute of Information on Traditional Chinese Medicine, China Academy of Chinese Medical Sciences.
