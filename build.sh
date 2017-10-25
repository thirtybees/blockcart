#!/usr/bin/env bash
CWD_BASENAME=${PWD##*/}

FILES=("logo.gif")
FILES+=("logo.png")
FILES+=("index.php")
FILES+=("ajax-cart.js")
FILES+=("${CWD_BASENAME}.css")
FILES+=("${CWD_BASENAME}.php")
FILES+=("${CWD_BASENAME}.tpl")
FILES+=("blockcart-ajax.php")
FILES+=("blockcart-json.tpl")
FILES+=("blockcart-set-collapse.php")
FILES+=("crossselling.tpl")
FILES+=("README.md")
FILES+=("img/**")
FILES+=("translations/**")

MODULE_VERSION="$(sed -ne "s/\\\$this->version *= *['\"]\([^'\"]*\)['\"] *;.*/\1/p" ${CWD_BASENAME}.php)"
MODULE_VERSION=${MODULE_VERSION//[[:space:]]}
ZIP_FILE="${CWD_BASENAME}/${CWD_BASENAME}-v${MODULE_VERSION}.zip"

echo "Going to zip ${CWD_BASENAME} version ${MODULE_VERSION}"

cd ..
for E in "${FILES[@]}"; do
  find ${CWD_BASENAME}/${E}  -type f -exec zip -9 ${ZIP_FILE} {} \;
done
