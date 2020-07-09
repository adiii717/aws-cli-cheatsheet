# required two paramater
# python package
# lambda layer name

path="app"
package="${1}"
layername="${2}"
mkdir -p $path
pip3 install "${package}" --target "${path}/python/lib/python3.8/site-packages/"
cd $path && zip -r ../lambdalayer.zip .
aws lambda publish-layer-version --layer-name "${layername}" --description "My layer" --license-info "MIT" --zip-file "fileb://../lambdalayer.zip" --compatible-runtimes python3.8

