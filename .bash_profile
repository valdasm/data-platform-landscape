export CRUNCHBASE_KEY_4="key-here"
export TWITTER_KEYS=clSBrmFJcMuP0ileQlzkHtINtdsYL0Z7je6uQo6pr6JyZTXV8C
export TWITTER_KEYS2=shbijmmK6vMvbz5uiDSjoMdQk
export GITHUB_KEY=acf71df021fddf209fefc7085a811cd2d5761913
export GITHUB_TOKEN=acf71df021fddf209fefc7085a811cd2d5761913
export REPOSITORY_URL=https://github.com/valdasm/data-platform-landscape

function y { export PROJECT_PATH=`pwd` && (cd ../landscapeapp && yarn run "$@")}
export -f y
# yf does a normal build and full test run
alias yf='y fetch'
alias yl='y check-links'
alias yq='y remove-quotes'
# yp does a build and then opens up the landscape in your browser ( can view the PDF and PNG files )
alias yp='y build && y open:dist'
# yo does a quick build and opens up the landscape in your browser
alias yo='y open:src'
alias a='for lpath in /usr/src/app/{landscapeapp,cdf-landscape,lfai-landscape}; do echo $lpath; git -C $lpath pull -p; done; (cd /usr/src/app/landscapeapp && yarn);'
alias yhi='y host-images'
