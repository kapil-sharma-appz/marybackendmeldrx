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
  "${BASE_URL}/api/Patient?given=John&family=Smith" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# Search by given name + birthdate
curl -X GET \
  "${BASE_URL}/api/Patient?given=Katherine&birthdate=1970-06-01" \
  -H "Authorization: Bearer ${TOKEN}"

echo ""

# Search by name (partial match)
curl -X GET \
  "${BASE_URL}/api/Patient?name=Smith" \
  -H "Authorization: Bearer ${TOKEN}"

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
