@echo off
REM ============================================================
REM  TCM-SO  |  Publish repository files required by the
REM             Data availability statement (compliance fix M2)
REM  Repo : Pinellia7ternata/TCM-Symptom-Ontology-v4.8  (branch: main)
REM
REM  Uploads:
REM    mappings/TCM-SO-HPO.sssom.tsv                 (649 mappings)
REM    mappings/TCM-SO-SNOMEDCT.sssom.tsv            (707 mappings)
REM    mappings/TCM-SO-ICD11.sssom.tsv               (973 mappings)
REM    documentation/mapping_provenance.csv
REM    documentation/translation_tier_audit.csv
REM    documentation/clinical_normalization_results.csv
REM    documentation/clinical_normalization_spotcheck_200.csv
REM    documentation/clinical_normalization_spotcheck_200_scored.csv   (double-blind rater decisions: 200 mentions x 2 raters)
REM    documentation/kappa_reannotation_sheet_rated.csv
REM
REM  NOTE: documentation/findingSite_category_conflicts.csv is already
REM        present remotely with equivalent content (BOM/CRLF only), so it
REM        is NOT pushed here. Remove the "REM" before the last copy line
REM        if you want to normalise it anyway.
REM
REM  Run  : double-click, or run from cmd in this folder.
REM         Credentials: Username = Pinellia7ternata
REM                      Password = a GitHub Personal Access Token (PAT)
REM ============================================================
setlocal
cd /d "%~dp0"
echo === TCM-SO repository upload helper ===
echo Working dir: %CD%
echo.

if not exist "_push\.git" (
  echo [1/4] Cloning remote repository into _push ...
  git clone https://github.com/Pinellia7ternata/TCM-Symptom-Ontology-v4.8.git _push
  if errorlevel 1 goto :err
) else (
  echo [1/4] _push already cloned, skipping clone.
)

echo [2/4] Copying files ...
if not exist "_push\mappings"      mkdir "_push\mappings"
if not exist "_push\documentation" mkdir "_push\documentation"

copy /Y "mappings\TCM-SO-HPO.sssom.tsv"      "_push\mappings\" >nul
copy /Y "mappings\TCM-SO-SNOMEDCT.sssom.tsv" "_push\mappings\" >nul
copy /Y "mappings\TCM-SO-ICD11.sssom.tsv"    "_push\mappings\" >nul

copy /Y "documentation\mapping_provenance.csv"              "_push\documentation\" >nul
copy /Y "documentation\translation_tier_audit.csv"          "_push\documentation\" >nul
copy /Y "documentation\clinical_normalization_results.csv"  "_push\documentation\" >nul
copy /Y "documentation\clinical_normalization_spotcheck_200.csv" "_push\documentation\" >nul
copy /Y "documentation\clinical_normalization_spotcheck_200_scored.csv" "_push\documentation\" >nul
copy /Y "documentation\kappa_reannotation_sheet_rated.csv"  "_push\documentation\" >nul
REM copy /Y "documentation\findingSite_category_conflicts.csv" "_push\documentation\" >nul

cd "_push"
echo [3/4] Staging and committing ...
git add "mappings/TCM-SO-HPO.sssom.tsv" "mappings/TCM-SO-SNOMEDCT.sssom.tsv" "mappings/TCM-SO-ICD11.sssom.tsv"
git add "documentation/mapping_provenance.csv" "documentation/translation_tier_audit.csv" "documentation/clinical_normalization_results.csv" "documentation/clinical_normalization_spotcheck_200.csv" "documentation/clinical_normalization_spotcheck_200_scored.csv" "documentation/kappa_reannotation_sheet_rated.csv"
git commit -m "Add SSSOM mapping sets (2,329 mappings), normalization spot-check (200 mentions, double-blind), and machine-readable supplementary tables"

echo [4/4] Pushing to origin main ...
git push origin main
if errorlevel 1 goto :err

echo.
echo === SUCCESS: all declared data-availability files are now published. ===
echo Next: rename the repository to TCM-Symptom-Ontology (Settings - General).
goto :end

:err
echo.
echo *** FAILED. Read the messages above. Common fixes: ***
echo   - git not on PATH  -^> install Git for Windows
echo   - auth failed      -^> use a Personal Access Token as the password
echo   - divergent branch -^> run "git pull --rebase origin main" inside _push

:end
cd /d "%~dp0"
echo.
pause
