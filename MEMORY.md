User Shayan communicates primarily in Persian/Farsi. Respond in Persian unless the task requires English (e.g., technical report content in English for international standards).
§
User uses DIgSILENT PowerFactory for substation studies including insulation coordination (EMT simulation). Has an insulation coordination project requiring a formal study report.
§
PowerShell escaping under bash: on Windows, inline PS commands with $variables (e.g. $_, $_.Property, $size) break because bash expands $ before PowerShell sees them. Always write complex PS scripts to a .ps1 file first via write_file, then execute with 'powershell -NoProfile -ExecutionPolicy Bypass -File "path\to\script.ps1"'. Don't inline multi-line PowerShell in terminal(command=...) calls.
§
On Windows (git-bash/MSYS), PowerShell `$_` and `$()` get consumed by bash before reaching PowerShell. Created `windows-tooling` skill with 3 workarounds: write .ps1 files, use execute_code+terminal(), or use WMIC for simple queries. Added `references/disk-scan-template.ps1` for C: drive inspection.
§
User has a 132kV GIS insulation coordination study project for MAJAN (Jalaan Bani Bu Ali Wind IPP, Oman) using Siemens 3EQ4 108 surge arrester. File: Insulation_Coordination_Study_MAJAN_132kV_GIS_1.xlsx. Key issue: Um should be 145kV (not 132kV per IEC 60071-1 Table 2). Earth-fault factor 1.4 needs verification per OETC Oman standards.
§
For Excel file analysis (xlsx), install openpyxl first with 'uv pip install openpyxl', then use openpyxl.load_workbook(path, data_only=True) for values or data_only=False for formulas. Remember that openpyxl does not calculate formulas — values appear as None with data_only=True unless the file was previously saved by Excel.
§
User expects technical reviews of insulation coordination studies and Excel calculations to be conducted with the rigor and detail of an expert electrical power engineering consultant (مهندس برق قدرت) according to IEC/IEEE standards.
§
User successfully deployed 9router to Railway at 9router-production-d443.up.railway.app. Configured with JWT_SECRET, INITIAL_PASSWORD, persistent volume at /app/data. This custom provider is now active in Hermes.