#!/usr/bin/env bash
# =============================================================================
#  marybackend – cURL API Reference
#  Base URL : http://localhost:3000
#  Auth     : All requests require:  -H "Authorization: Bearer <ACCESS_TOKEN>"
#
#  Set your token once and reuse:
#    export TOKEN="<your_access_token>"
# =============================================================================

BASE_URL="http://localhost:3000"

# ─────────────────────────────────────────────────────────────────────────────
# PATIENT ROUTES  →  /api/Patient
# ─────────────────────────────────────────────────────────────────────────────

# 1. Search / list patients
#    GET /api/Patient
#    Query params (all optional): given, family, birthdate (YYYY-MM-DD), gender, name
# -----------------------------------------------------------------------------

# Search by given + family name
curl -X GET \
  "${BASE_URL}/Patient?given=John&family=Smith" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# Search by given name + birthdate
curl -X GET \
  "${BASE_URL}/Patient?given=Katherine&birthdate=1970-06-01" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# Search by name (partial match)
curl -X GET \
  "${BASE_URL}/api/Patient?name=Smith" \
  -H "Authorization:oken=eyJhbGciOiJSUzI1NiIsImtpZCI6IjQxNzkxREE2MTI5MkU1QTRCMEEyRjE1OEQ3MDYwRDQ3IiwidHlwIjoiYXQrand0In0.eyJpc3MiOiJodHRwczovL2FwcC5tZWxkcnguY29tIiwibmJmIjoxNzcyNjk2NjcwLCJpYXQiOjE3NzI2OTY2NzAsImV4cCI6MTc3MjcwMDI3MCwic2NvcGUiOlsib3BlbmlkIiwiZmhpclVzZXIiLCJ1c2VyL0FsbGVyZ3lJbnRvbGVyYW5jZS5yZWFkIiwidXNlci9BbGxlcmd5SW50b2xlcmFuY2Uud3JpdGUiLCJ1c2VyL0FwcG9pbnRtZW50LnJlYWQiLCJ1c2VyL0FwcG9pbnRtZW50LndyaXRlIiwidXNlci9Db25kaXRpb24ucmVhZCIsInVzZXIvQ29uZGl0aW9uLnJlYWQ_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9jb25kaXRpb24tY2F0ZWdvcnl8cHJvYmxlbS1saXN0LWl0ZW0iLCJ1c2VyL0NvbmRpdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vY29uZGl0aW9uLWNhdGVnb3J5fGVuY291bnRlci1kaWFnbm9zaXMiLCJ1c2VyL0NvbmRpdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly9obDcub3JnL2ZoaXIvdXMvY29yZS9Db2RlU3lzdGVtL2NvbmRpdGlvbi1jYXRlZ29yeXxoZWFsdGgtY29uY2VybiIsInVzZXIvQ29uZGl0aW9uLndyaXRlIiwidXNlci9Db25kaXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9jb25kaXRpb24tY2F0ZWdvcnl8cHJvYmxlbS1saXN0LWl0ZW0iLCJ1c2VyL0NvbmRpdGlvbi53cml0ZT9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL2NvbmRpdGlvbi1jYXRlZ29yeXxlbmNvdW50ZXItZGlhZ25vc2lzIiwidXNlci9Db25kaXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL2hsNy5vcmcvZmhpci91cy9jb3JlL0NvZGVTeXN0ZW0vY29uZGl0aW9uLWNhdGVnb3J5fGhlYWx0aC1jb25jZXJuIiwidXNlci9EZXZpY2UucmVhZCIsInVzZXIvRGlhZ25vc3RpY1JlcG9ydC5yZWFkIiwidXNlci9Eb2N1bWVudFJlZmVyZW5jZS5yZWFkIiwidXNlci9FbmNvdW50ZXIucmVhZCIsInVzZXIvR29hbC5yZWFkIiwidXNlci9JbW11bml6YXRpb24ucmVhZCIsInVzZXIvTWVkaWNhdGlvblJlcXVlc3QucmVhZCIsInVzZXIvTWVkaWNhdGlvblJlcXVlc3Qud3JpdGUiLCJ1c2VyL01lZGljYXRpb25TdGF0ZW1lbnQucmVhZCIsInVzZXIvT2JzZXJ2YXRpb24ucmVhZCIsInVzZXIvT2JzZXJ2YXRpb24ucmVhZD9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL29ic2VydmF0aW9uLWNhdGVnb3J5fGNsaW5pY2FsLXRlc3QiLCJ1c2VyL09ic2VydmF0aW9uLnJlYWQ_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9vYnNlcnZhdGlvbi1jYXRlZ29yeXxsYWJvcmF0b3J5IiwidXNlci9PYnNlcnZhdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8c29jaWFsLWhpc3RvcnkiLCJ1c2VyL09ic2VydmF0aW9uLnJlYWQ_Y2F0ZWdvcnk9aHR0cDovL2hsNy5vcmcvZmhpci91cy9jb3JlL0NvZGVTeXN0ZW0vdXMtY29yZS1jYXRlZ29yeXxzZG9oIiwidXNlci9PYnNlcnZhdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8c3VydmV5IiwidXNlci9PYnNlcnZhdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8dml0YWwtc2lnbnMiLCJ1c2VyL09ic2VydmF0aW9uLndyaXRlIiwidXNlci9PYnNlcnZhdGlvbi53cml0ZT9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL29ic2VydmF0aW9uLWNhdGVnb3J5fGNsaW5pY2FsLXRlc3QiLCJ1c2VyL09ic2VydmF0aW9uLndyaXRlP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8bGFib3JhdG9yeSIsInVzZXIvT2JzZXJ2YXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9vYnNlcnZhdGlvbi1jYXRlZ29yeXxzb2NpYWwtaGlzdG9yeSIsInVzZXIvT2JzZXJ2YXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL2hsNy5vcmcvZmhpci91cy9jb3JlL0NvZGVTeXN0ZW0vdXMtY29yZS1jYXRlZ29yeXxzZG9oIiwidXNlci9PYnNlcnZhdGlvbi53cml0ZT9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL29ic2VydmF0aW9uLWNhdGVnb3J5fHN1cnZleSIsInVzZXIvT2JzZXJ2YXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9vYnNlcnZhdGlvbi1jYXRlZ29yeXx2aXRhbC1zaWducyIsInVzZXIvUHJvY2VkdXJlLnJlYWQiLCJ1c2VyL1NlcnZpY2VSZXF1ZXN0LnJlYWQiLCJ1c2VyL1BhdGllbnQucmVhZCIsInVzZXIvUGF0aWVudC53cml0ZSIsInVzZXIvUHJhY3RpdGlvbmVyLnJlYWQiLCJ1c2VyL09yZ2FuaXphdGlvbi5yZWFkIiwidXNlci9Mb2NhdGlvbi5yZWFkIiwidXNlci9SZWxhdGVkUGVyc29uLnJlYWQiLCJ1c2VyL0NvdmVyYWdlLnJlYWQiLCJ1c2VyL0V4cGxhbmF0aW9uT2ZCZW5lZml0LnJlYWQiLCJ1c2VyL1NjaGVkdWxlLnJlYWQiLCJ1c2VyL1Nsb3QucmVhZCIsInVzZXIvQmluYXJ5LnJlYWQiLCJ1c2VyL1F1ZXN0aW9ubmFpcmUucmVhZCIsInVzZXIvUXVlc3Rpb25uYWlyZVJlc3BvbnNlLnJlYWQiLCJ1c2VyL1F1ZXN0aW9ubmFpcmVSZXNwb25zZS53cml0ZSIsInVzZXIvQ2FyZVBsYW4ucmVhZCIsInVzZXIvQ2FyZVRlYW0ucmVhZCIsInVzZXIvQ29tbXVuaWNhdGlvbi5yZWFkIiwidXNlci9GYW1pbHlNZW1iZXJIaXN0b3J5LnJlYWQiLCJ1c2VyL1Byb3ZlbmFuY2UucmVhZCIsInVzZXIvVGFzay5yZWFkIiwidXNlci9UYXNrLndyaXRlIl0sImFtciI6WyJwd2QiXSwiY2xpZW50X2lkIjoiNTA2N2VkYWIyNGY4NDM0YTg2NGQ2Y2MzZWFkMWExNTQiLCJzdWIiOiIxY2I1NTliMi0xYWMyLTQ2ZDEtODgyNi1lZDIyMTQzNmVlNmQiLCJhdXRoX3RpbWUiOjE3NzI1MTczNTcsImlkcCI6ImxvY2FsIiwidGVuYW50IjoiW1x1MDAyMmIxZWYzMGVhLTQ3YTMtNDBlNC1iMzcyLTA4ZGQyZjc0M2U2Y1x1MDAyMl0iLCJtZWxkcngtdXNlci10eXBlIjoiUHJvdmlkZXIiLCJzaWQiOiI4RjQ3NUM1MjVBOUY3RUYxNDgyODg3RTNDNTUyMUM4MyIsImp0aSI6IjhGNzYzRDMyQURFNEVCNTBDOUQzNzEwRDY2NzE5QkI3In0.f4ocnYzO4kP84RxOU_R8O7Ugd6Tn1UHoFGujps0CXy4XoIK_rPTenNauEZpH7C2F1v8lCbFHnCjc9dqfhwwoHlpKmO5tZ9UuI2mBo1dXbGT_v7YPDnqhXL5GjZDZVfyEoDwxhpKFUrFmyUxUViAQGD3agQc-_eS7MvRSxtJQuzPxMsflhZeCyrcQpl-yuDKd9o2cPBllsb2i86RFMkAbykrsvwQhWNjLRdAUvEH7NP3ZahdoJVTtTjYR73uWhp4ujR9EwJy4lPZa-roxoken=eyJhbGciOiJSUzI1NiIsImtpZCI6IjQxNzkxREE2MTI5MkU1QTRCMEEyRjE1OEQ3MDYwRDQ3IiwidHlwIjoiYXQrand0In0.eyJpc3MiOiJodHRwczovL2FwcC5tZWxkcnguY29tIiwibmJmIjoxNzcyNjk2NjcwLCJpYXQiOjE3NzI2OTY2NzAsImV4cCI6MTc3MjcwMDI3MCwic2NvcGUiOlsib3BlbmlkIiwiZmhpclVzZXIiLCJ1c2VyL0FsbGVyZ3lJbnRvbGVyYW5jZS5yZWFkIiwidXNlci9BbGxlcmd5SW50b2xlcmFuY2Uud3JpdGUiLCJ1c2VyL0FwcG9pbnRtZW50LnJlYWQiLCJ1c2VyL0FwcG9pbnRtZW50LndyaXRlIiwidXNlci9Db25kaXRpb24ucmVhZCIsInVzZXIvQ29uZGl0aW9uLnJlYWQ_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9jb25kaXRpb24tY2F0ZWdvcnl8cHJvYmxlbS1saXN0LWl0ZW0iLCJ1c2VyL0NvbmRpdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vY29uZGl0aW9uLWNhdGVnb3J5fGVuY291bnRlci1kaWFnbm9zaXMiLCJ1c2VyL0NvbmRpdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly9obDcub3JnL2ZoaXIvdXMvY29yZS9Db2RlU3lzdGVtL2NvbmRpdGlvbi1jYXRlZ29yeXxoZWFsdGgtY29uY2VybiIsInVzZXIvQ29uZGl0aW9uLndyaXRlIiwidXNlci9Db25kaXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9jb25kaXRpb24tY2F0ZWdvcnl8cHJvYmxlbS1saXN0LWl0ZW0iLCJ1c2VyL0NvbmRpdGlvbi53cml0ZT9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL2NvbmRpdGlvbi1jYXRlZ29yeXxlbmNvdW50ZXItZGlhZ25vc2lzIiwidXNlci9Db25kaXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL2hsNy5vcmcvZmhpci91cy9jb3JlL0NvZGVTeXN0ZW0vY29uZGl0aW9uLWNhdGVnb3J5fGhlYWx0aC1jb25jZXJuIiwidXNlci9EZXZpY2UucmVhZCIsInVzZXIvRGlhZ25vc3RpY1JlcG9ydC5yZWFkIiwidXNlci9Eb2N1bWVudFJlZmVyZW5jZS5yZWFkIiwidXNlci9FbmNvdW50ZXIucmVhZCIsInVzZXIvR29hbC5yZWFkIiwidXNlci9JbW11bml6YXRpb24ucmVhZCIsInVzZXIvTWVkaWNhdGlvblJlcXVlc3QucmVhZCIsInVzZXIvTWVkaWNhdGlvblJlcXVlc3Qud3JpdGUiLCJ1c2VyL01lZGljYXRpb25TdGF0ZW1lbnQucmVhZCIsInVzZXIvT2JzZXJ2YXRpb24ucmVhZCIsInVzZXIvT2JzZXJ2YXRpb24ucmVhZD9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL29ic2VydmF0aW9uLWNhdGVnb3J5fGNsaW5pY2FsLXRlc3QiLCJ1c2VyL09ic2VydmF0aW9uLnJlYWQ_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9vYnNlcnZhdGlvbi1jYXRlZ29yeXxsYWJvcmF0b3J5IiwidXNlci9PYnNlcnZhdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8c29jaWFsLWhpc3RvcnkiLCJ1c2VyL09ic2VydmF0aW9uLnJlYWQ_Y2F0ZWdvcnk9aHR0cDovL2hsNy5vcmcvZmhpci91cy9jb3JlL0NvZGVTeXN0ZW0vdXMtY29yZS1jYXRlZ29yeXxzZG9oIiwidXNlci9PYnNlcnZhdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8c3VydmV5IiwidXNlci9PYnNlcnZhdGlvbi5yZWFkP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8dml0YWwtc2lnbnMiLCJ1c2VyL09ic2VydmF0aW9uLndyaXRlIiwidXNlci9PYnNlcnZhdGlvbi53cml0ZT9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL29ic2VydmF0aW9uLWNhdGVnb3J5fGNsaW5pY2FsLXRlc3QiLCJ1c2VyL09ic2VydmF0aW9uLndyaXRlP2NhdGVnb3J5PWh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vb2JzZXJ2YXRpb24tY2F0ZWdvcnl8bGFib3JhdG9yeSIsInVzZXIvT2JzZXJ2YXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9vYnNlcnZhdGlvbi1jYXRlZ29yeXxzb2NpYWwtaGlzdG9yeSIsInVzZXIvT2JzZXJ2YXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL2hsNy5vcmcvZmhpci91cy9jb3JlL0NvZGVTeXN0ZW0vdXMtY29yZS1jYXRlZ29yeXxzZG9oIiwidXNlci9PYnNlcnZhdGlvbi53cml0ZT9jYXRlZ29yeT1odHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL29ic2VydmF0aW9uLWNhdGVnb3J5fHN1cnZleSIsInVzZXIvT2JzZXJ2YXRpb24ud3JpdGU_Y2F0ZWdvcnk9aHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS9vYnNlcnZhdGlvbi1jYXRlZ29yeXx2aXRhbC1zaWducyIsInVzZXIvUHJvY2VkdXJlLnJlYWQiLCJ1c2VyL1NlcnZpY2VSZXF1ZXN0LnJlYWQiLCJ1c2VyL1BhdGllbnQucmVhZCIsInVzZXIvUGF0aWVudC53cml0ZSIsInVzZXIvUHJhY3RpdGlvbmVyLnJlYWQiLCJ1c2VyL09yZ2FuaXphdGlvbi5yZWFkIiwidXNlci9Mb2NhdGlvbi5yZWFkIiwidXNlci9SZWxhdGVkUGVyc29uLnJlYWQiLCJ1c2VyL0NvdmVyYWdlLnJlYWQiLCJ1c2VyL0V4cGxhbmF0aW9uT2ZCZW5lZml0LnJlYWQiLCJ1c2VyL1NjaGVkdWxlLnJlYWQiLCJ1c2VyL1Nsb3QucmVhZCIsInVzZXIvQmluYXJ5LnJlYWQiLCJ1c2VyL1F1ZXN0aW9ubmFpcmUucmVhZCIsInVzZXIvUXVlc3Rpb25uYWlyZVJlc3BvbnNlLnJlYWQiLCJ1c2VyL1F1ZXN0aW9ubmFpcmVSZXNwb25zZS53cml0ZSIsInVzZXIvQ2FyZVBsYW4ucmVhZCIsInVzZXIvQ2FyZVRlYW0ucmVhZCIsInVzZXIvQ29tbXVuaWNhdGlvbi5yZWFkIiwidXNlci9GYW1pbHlNZW1iZXJIaXN0b3J5LnJlYWQiLCJ1c2VyL1Byb3ZlbmFuY2UucmVhZCIsInVzZXIvVGFzay5yZWFkIiwidXNlci9UYXNrLndyaXRlIl0sImFtciI6WyJwd2QiXSwiY2xpZW50X2lkIjoiNTA2N2VkYWIyNGY4NDM0YTg2NGQ2Y2MzZWFkMWExNTQiLCJzdWIiOiIxY2I1NTliMi0xYWMyLTQ2ZDEtODgyNi1lZDIyMTQzNmVlNmQiLCJhdXRoX3RpbWUiOjE3NzI1MTczNTcsImlkcCI6ImxvY2FsIiwidGVuYW50IjoiW1x1MDAyMmIxZWYzMGVhLTQ3YTMtNDBlNC1iMzcyLTA4ZGQyZjc0M2U2Y1x1MDAyMl0iLCJtZWxkcngtdXNlci10eXBlIjoiUHJvdmlkZXIiLCJzaWQiOiI4RjQ3NUM1MjVBOUY3RUYxNDgyODg3RTNDNTUyMUM4MyIsImp0aSI6IjhGNzYzRDMyQURFNEVCNTBDOUQzNzEwRDY2NzE5QkI3In0.f4ocnYzO4kP84RxOU_R8O7Ugd6Tn1UHoFGujps0CXy4XoIK_rPTenNauEZpH7C2F1v8lCbFHnCjc9dqfhwwoHlpKmO5tZ9UuI2mBo1dXbGT_v7YPDnqhXL5GjZDZVfyEoDwxhpKFUrFmyUxUViAQGD3agQc-_eS7MvRSxtJQuzPxMsflhZeCyrcQpl-yuDKd9o2cPBllsb2i86RFMkAbykrsvwQhWNjLRdAUvEH7NP3ZahdoJVTtTjYR73uWhp4ujR9EwJy4lPZa-roxqizLLSW7jkh_SaQ2YmD8as9fUHhoWrUD-HsJlY0880kZERXXmHGDp45BGjhHBTU9H4Z12AqizLLSW7jkh_SaQ2YmD8as9fUHhoWrUD-HsJlY0880kZERXXmHGDp45BGjhHBTU9H4Z12A Bearer ${TOKEN}"

echo ""

# ─────────────────────────────────────────────────────────────────────────────
# 2. Get patient by ID
#    GET /api/Patient/:patient_id
# -----------------------------------------------------------------------------

curl -X GET \
  "${BASE_URL}/api/Patient/ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# ─────────────────────────────────────────────────────────────────────────────
# RESOURCE ROUTES  →  /api/Patient/:resourceType[/:id]
#    Query params: patient (patient ID), parameters (URL-encoded key=value pairs)
#    Note: provide EITHER ?patient= OR /:id, not both
# ─────────────────────────────────────────────────────────────────────────────

# 3a. Observation – vital signs for a patient
#     GET /api/Patient/Observation?patient=<id>&category=vital-signs
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Observation?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&category=vital-signs" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 3b. Observation – laboratory results for a patient
curl -X GET \
  "${BASE_URL}/api/Patient/Observation?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&category=laboratory" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 3c. Observation – specific LOINC code (HbA1c = 4548-4)
curl -X GET \
  "${BASE_URL}/api/Patient/Observation?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&code=4548-4" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 3d. Observation – by specific date
curl -X GET \
  "${BASE_URL}/api/Patient/Observation?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&date=2024-01-15" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 4. Encounter – all encounters for a patient
#    GET /api/Patient/Encounter?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Encounter?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 4b. Encounter – filtered by date
curl -X GET \
  "${BASE_URL}/api/Patient/Encounter?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&date=2024-01-01" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 5. Condition – all conditions for a patient
#    GET /api/Patient/Condition?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Condition?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 5b. Condition – filtered by category  (e.g. problem-list-item)
curl -X GET \
  "${BASE_URL}/api/Patient/Condition?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&category=problem-list-item" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 6. AllergyIntolerance – all allergies for a patient
#    GET /api/Patient/AllergyIntolerance?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/AllergyIntolerance?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 7. Immunization – all immunizations for a patient
#    GET /api/Patient/Immunization?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Immunization?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 7b. Immunization – filtered by date
curl -X GET \
  "${BASE_URL}/api/Patient/Immunization?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&date=2023-06-15" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 8. Procedure – all procedures for a patient
#    GET /api/Patient/Procedure?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Procedure?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 8b. Procedure – filtered by category (103693007 = Diagnostic, 387713003 = Surgical)
curl -X GET \
  "${BASE_URL}/api/Patient/Procedure?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&category=103693007" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 9. CarePlan – all care plans for a patient
#    GET /api/Patient/CarePlan?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/CarePlan?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 10. FamilyMemberHistory – for a patient
#     GET /api/Patient/FamilyMemberHistory?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/FamilyMemberHistory?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 11. Practitioner – search by name
#     GET /api/Patient/Practitioner?patient=<id>  (or filter by name/address)
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Practitioner?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&family=Smith" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 11b. Practitioner – filter by city
curl -X GET \
  "${BASE_URL}/api/Patient/Practitioner?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a&address-city=Chicago" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 12. Organization – for a patient
#     GET /api/Patient/Organization?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Organization?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 13. Location – for a patient
#     GET /api/Patient/Location?patient=<id>
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Location?patient=ac7b078b-27c9-49b8-a104-ade63dcafa1a" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# 14. Get a resource by specific resource ID (no patient param)
#     GET /api/Patient/:resourceType/:id
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/Patient/Observation/some-observation-id" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# ─────────────────────────────────────────────────────────────────────────────
# 15. Add / POST a resource
#     POST /api/Patient/:resourceType
#     Body: { "requestBody": { ... FHIR resource JSON ... } }
# ─────────────────────────────────────────────────────────────────────────────

# Example: Add an Observation
curl -X POST \
  "${BASE_URL}/api/Patient/Observation" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "requestBody": {
      "resourceType": "Observation",
      "status": "final",
      "category": [
        {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/observation-category",
              "code": "vital-signs"
            }
          ]
        }
      ],
      "code": {
        "coding": [
          {
            "system": "http://loinc.org",
            "code": "29463-7",
            "display": "Body Weight"
          }
        ]
      },
      "subject": { "reference": "Patient/ac7b078b-27c9-49b8-a104-ade63dcafa1a" },
      "valueQuantity": {
        "value": 70,
        "unit": "kg",
        "system": "http://unitsofmeasure.org",
        "code": "kg"
      }
    }
  }'

echo ""

# ─────────────────────────────────────────────────────────────────────────────
# WORKSPACE ROUTES  →  /api/workspace
# ─────────────────────────────────────────────────────────────────────────────

# 16. Get workspace list
#     GET /api/workspace
# -----------------------------------------------------------------------------
curl -X GET \
  "${BASE_URL}/api/workspace" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""
