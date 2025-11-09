#!/bin/bash

# Test Authentication System
# This script tests both public and protected endpoints

API_KEY="sk_3ff143cc67dfa404986cc34bec5a8d7b1682c9fa0d7383216d99a6f3cb261aa3"
BASE_URL="http://localhost:3000"

echo "🧪 Testing Authentication System"
echo "=================================="
echo ""

# Test 1: Public endpoint (should work without auth)
echo "1️⃣  Testing PUBLIC endpoint (no auth required)..."
echo "   GET ${BASE_URL}/api/trpc/auth.public"
curl -s "${BASE_URL}/api/trpc/auth.public" | jq '.'
echo ""
echo ""

# Test 2: Protected endpoint WITHOUT API key (should fail)
echo "2️⃣  Testing PROTECTED endpoint WITHOUT API key (should fail)..."
echo "   GET ${BASE_URL}/api/trpc/auth.protected"
RESPONSE=$(curl -s "${BASE_URL}/api/trpc/auth.protected")
echo "$RESPONSE" | jq '.'
echo ""
echo ""

# Test 3: Protected endpoint WITH API key (should succeed)
echo "3️⃣  Testing PROTECTED endpoint WITH API key (should succeed)..."
echo "   GET ${BASE_URL}/api/trpc/auth.protected"
echo "   Authorization: Bearer ${API_KEY:0:20}..."
curl -s -H "Authorization: Bearer ${API_KEY}" "${BASE_URL}/api/trpc/auth.protected" | jq '.'
echo ""
echo ""

# Test 4: Whoami endpoint (should return user info)
echo "4️⃣  Testing WHOAMI endpoint (should return user info)..."
echo "   GET ${BASE_URL}/api/trpc/auth.whoami"
curl -s -H "Authorization: Bearer ${API_KEY}" "${BASE_URL}/api/trpc/auth.whoami" | jq '.'
echo ""
echo ""

echo "✅ Auth testing complete!"
