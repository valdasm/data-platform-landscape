# Installation

## Install on Mac
1. Install [Homebrew](https://brew.sh/)
2. `brew install node`
3. `git clone git@github.com:graphql/graphql-landscape.git`

## Install on Linux
1. `git clone git@github.com:graphql/graphql-landscape.git`
2. Please follow [this script](https://github.com/cncf/landscapeapp/blob/master/update_server/setup.template) to install correct versions of `nodejs` and other packages on Linux.

## Local development with installing all dependencies
1. `git pull`
2. `npm install` (installs dependencies)
* `npm run open:src` (starts a development server) or
* `npm run build`, then `npm run open:dist` (compiles and opens a production build)

* If getting Error: Failed to launch chrome! run below
* sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

## Local development with installing landscapeapp locally

You can administer a landscape without ever needing to install the software locally. However, a local install is helpful for rapid development, as it reduces the 5 minute build time on Netlify to 10 seconds or less locally. In particular, you want a local install when you're reconfiguring the layout. We recommend installing one or more landscapes as sibling directories to the landscapeapp. Then, you want to install the npm modules for landscapeapp but not for any of the landscapes. Here are the [install](INSTALL.md) directions.

So, if you're in a directory called `dev`, you would do:
```sh
dev$ git clone git@github.com:cncf/landscapeapp.git
dev$ git clone git@github.com:cdfoundation/cdf-landscape.git
dev$ cd landscapeapp
dev$ npm install -g yarn@latest
dev$ yarn
```
Now, to use the local landscapeapp you can add the following to your `~/.bash_profile` or `.zshrc`:
```sh
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
alias a='for lpath in /Users/your-username/dev/{landscapeapp,cdf-landscape,lfai-landscape}; do echo $lpath; git -C $lpath pull -p; done; (cd /Users/your-username/dev/landscapeapp && yarn);'

```
Reload with `. ~/.bash_profile` and then use `yo`, `yf`, etc. to run functions on the landscape in your landscape directory. `a` will do a git pull on each of the project directories you specify and install any necessary node modules for landscapeapp.

## Review build details
1. `npm run build`
1. `open dist/report.html`

## Updating data

After making your changes to `landscape.yml`, run `npm run fetch` to fetch any needed data and generate [processed_landscape.yml](processed_landscape.yml) and [data.json](. /src/data.json).

`npm run fetch` runs in 4 modes of increasingly aggressive downloading, with a default to easy. Reading data from the cache (meaning from processed_landscape.yml) means that no new data is fetched if the project/product already exists. The modes are:

| Data cached            | easy   | medium   | hard   | complete   |
|------------------------|--------|----------|--------|------------|
| **Crunchbase**         | true   | false    | false  | false      |
| **GitHub basic stats** | true   | false    | false  | false      |
| **GitHub start dates** | true   | true     | false  | false      |
| **Image data**         | true   | true     | true   | false      |

* **Easy** mode just fetches any data needed for new projects/products.
* **Medium** fetches Crunchbase and basic GitHub data for all projects/products.
* **Hard** also fetches GitHub start dates. These should not change so this should not be necessary.
* **Complete** also re-fetches all images. This is problematic because images tend to become unavailable (404) over time, even though the local cache is fine.

Easy mode (the default) is what you should use if you update `landscape.yml` and want to see the results locally. The Netlify build server runs easy mode, which makes it possible to just commit a change to landscape.yml and have the results reflected in production. Run with `npm run fetch`.

Medium mode is what is run by the update server, with commits back to the repo. It needs to be run regularly to update last commit date, stars, and Crunchbase info. Run with `npm run update`.

Hard and complete modes should be unnecessary except in cases of possible data corruption. Even then, it's better to just delete any problematic entries from `processed_landscape.yml` and easy mode will recreate them with up-to-date information.

### Adding a custom image

If you can't find the right logo on the web, you can create a custom one and host it in this repo:

1. Save the logo to `src/hosted_logos/`, for example, `src/hosted_logos/apex.svg`. Use lowercase spinal case (i.e., hyphens) for the name.
1. Update landscape.yml, for example, `logo: ./src/hosted_logos/apex.svg`. The location must start with`./src/hosted_logos`.
1. If you've updated the local logo since a previous commit, you need to delete the cached version in `.src/cached_logos/`. E.g., delete `./src/cached_logos/apex.svg`.
1. Update `processed_landscape.yml` with `npm run fetch`.
1. Commit and push. Double-check your work in the Netlify preview after opening a pull request.

