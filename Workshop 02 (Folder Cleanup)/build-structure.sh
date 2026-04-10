#!/bin/bash

# ============================================================
#  Johnny Decimal Structure Builder — Sample Template
# ============================================================
#
#  HOW TO USE:
#    1. Edit the sections below to match YOUR structure
#    2. Save the file
#    3. Run it:  bash build-structure.sh
#
#  TIPS:
#    - mkdir -p is safe — it won't overwrite existing folders
#    - You can re-run this script anytime to add new folders
#    - Lines starting with # are comments (ignored by the script)
#
# ============================================================

# Where to create the structure (change this to your preferred location)
BASE_DIR="$HOME/Documents/My System"

echo "Building folder structure at: $BASE_DIR"
echo "================================================"

# Create base directory
mkdir -p "$BASE_DIR"

# =============================================
# AREA: 10-19 Life Admin
# =============================================
# Housing, finances, car, health, and travel

mkdir -p "$BASE_DIR/10-19 Life Admin/11 House"
mkdir -p "$BASE_DIR/10-19 Life Admin/11 House/11.01 Lease"
mkdir -p "$BASE_DIR/10-19 Life Admin/11 House/11.02 Electric"
mkdir -p "$BASE_DIR/10-19 Life Admin/11 House/11.03 Internet"

mkdir -p "$BASE_DIR/10-19 Life Admin/12 Finance"
# mkdir -p "$BASE_DIR/10-19 Life Admin/12 Finance/12.01 YOUR ITEM HERE"

mkdir -p "$BASE_DIR/10-19 Life Admin/13 Motor"
mkdir -p "$BASE_DIR/10-19 Life Admin/13 Motor/13.01 Insurance"
mkdir -p "$BASE_DIR/10-19 Life Admin/13 Motor/13.02 Service"

mkdir -p "$BASE_DIR/10-19 Life Admin/14 Health"
# mkdir -p "$BASE_DIR/10-19 Life Admin/14 Health/14.01 YOUR ITEM HERE"

mkdir -p "$BASE_DIR/10-19 Life Admin/15 Travel"
# mkdir -p "$BASE_DIR/10-19 Life Admin/15 Travel/15.01 YOUR ITEM HERE"


# =============================================
# AREA: 20-29 My Hobby
# =============================================
# Research, promotion, and sales for your hobby

mkdir -p "$BASE_DIR/20-29 My Hobby/21 Research"

mkdir -p "$BASE_DIR/20-29 My Hobby/22 Promotion"
mkdir -p "$BASE_DIR/20-29 My Hobby/22 Promotion/22.01 Social Media"
mkdir -p "$BASE_DIR/20-29 My Hobby/22 Promotion/22.02 Newsletter"

mkdir -p "$BASE_DIR/20-29 My Hobby/23 Sales"


# =============================================
# AREA: 30-39 My Side-Hustle
# =============================================
# Building and shipping your side project

mkdir -p "$BASE_DIR/30-39 My Side-Hustle/31 Build It"
mkdir -p "$BASE_DIR/30-39 My Side-Hustle/32 Ship It"
# mkdir -p "$BASE_DIR/30-39 My Side-Hustle/33 YOUR ITEM HERE"


# =============================================
# DONE
# =============================================

echo ""
echo "================================================"
echo "Structure created successfully!"
echo ""
echo "To see your new structure, run:"
echo "  tree -d \"$BASE_DIR\""
echo ""
echo "To open it in Finder, run:"
echo "  open \"$BASE_DIR\""
echo "================================================"
