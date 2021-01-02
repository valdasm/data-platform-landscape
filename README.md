
# Azure Data Platform Landscape

![Azure Data Platform Landscape Logo](https://landscape.dataplatformschool.com/images/left-logo.svg)

- [Azure Data Platform Landscape](#cloud-native-landscape)
  * [Current Version](#current-version)
  * [Interactive Version](#interactive-version)
  * [New Entries](#new-entries)
  * [Logos](#logos)
  * [Proper SVGs](#proper-svgs)
  * [Corrections](#corrections)
  * [External Data](#external-data)
  * [License](#license)
  * [Formats](#formats)
  * [Installation](#installation)
  * [Vulnerability reporting](#vulnerability-reporting)
  * [Adjusting the Landscape View](#adjusting-the-landscape-view)


The Azure Data Platform landscape (png, pdf) is a dynamically generated architecture diagram below. The landscape visualizes Azure native services, and also available 3rd party components and services. 

Services often go beyond their default functionalities, and fit multiple categories. Hence, the landscape tries to capture all features of a certain product or service. Hopefully, the landscape will help you find out best of the breed solutions for your problems, at the same time reducing number of vendors or components.

It is modelled after the Cloud Native Computing Foundation (CNCF) [landscape](https://landscape.cncf.io) and based on the same open source code.

## Current Version

[![Azure Data Platform Landscape](https://landscape.dataplatformschool.com/images/landscape.png)](https://landscape.dataplatformschool.com/images/landscape.png)

## Interactive Version

Please see [https://landscape.dataplatformschool.como](https://landscape.dataplatformschool.com).

## New Entries

* Projects/services must integrate natively with Azure (storages, networking, etc.)
* CNCF landscape application uses Crunchbase organization information. As the Crunchbase API is not free, it's been decided to remove Crunchbase integration for Azure Data Platform Landscape. It's not an ideal solution as company information needs to be populated manually, based on official websites and/or Wikipedia
* If you think your project should be included, please open a pull request to add it to [landscape.yml](landscape.yml). For the logo, upload an SVG to the `hosted_logos` directory.
* If you need a new category or have layout suggestions, please raise an [issue](https://github.com/valdasm/data-platform-landscape/issues/new) or reach out to valdas@maksimavicius.eu

## Logos

The following rules will produce the most readable and attractive logos:

1. We require SVGs, as they are smaller, display correctly at any scale, and work on all modern browsers. If you only have the logo in another vector format (like AI or EPS), please open an issue and we'll convert it to an SVG for you, or you can often do it yourself at https://cloudconvert.com/. Note that you may need to zip your file to attach it to a GitHub issue. Please note that we require pure SVGs and will reject SVGs that contain embedded PNGs since they have the same problems of being bigger and not scaling seamlessly. We also require that SVGs convert fonts to outlines so that they will render correctly whether or not a font is installed. See [Proper SVGs](#proper-svgs) below.
2. When multiple variants exist, use stacked (not horizontal) logos. For example, we use the second column (stacked), not the first (horizontal), of CNCF project [logos](https://github.com/cncf/artwork/#cncf-incubating-logos).
3. Don't use reversed logos (i.e., with a non-white, non-transparent background color). If you only have a reversed logo, create an issue with it attached and we'll produce a non-reversed version for you.
4. Logos must include the company, product or project name in English. It's fine to also include words from another language. If you don't have a version of your logo with the name in it, please open an issue and we'll create one for you (and please specify the font).
5. Match the item name to the English words in the logos. So an Acme Rocket logo that shows "Rocket" should have product name "Rocket", while if the logo shows "Acme Rocket", the product name should be "Acme Rocket". Otherwise, logos looks out of place when you sort alphabetically.
6. Google images is often the best way to find a good version of the logo (but ensure it's the up-to-date version). Search for [grpc logo filetype:svg](https://www.google.com/search?q=grpc+logo&tbs=ift:svg,imgo:1&tbm=isch) but substitute your project or product name for grpc.
7. You can either upload an SVG to the `hosted_logos` directory or put a URL as the value, and it will be fetched.

## Proper SVGs

SVGs need to not rely on external fonts so that they will render correctly in any web browser, whether or not the correct fonts are installed. If you have the original AI file, here are the steps in Illustrator to create a proper SVG:

1. Open file in Illustrator
2. Select all text
3. With the text selected, go to Object > Expand in the top menu
4. Export file by going to File > Export > Export As in top menu
5. Select SVG from the format drop down and make sure that "Use Artboards" is checked
6. This will open a SVG options box, make sure to set Decimal to 5 (that is the highest possible, so to ensure that sufficient detail is preserved)
7. Click Okay to export

## Corrections

Please open a pull request with edits to [landscape.yml](landscape.yml). As the project does not use Crunchbase data, company information has to be added to [processed_landscape.yml](processed_landscape.yml)

## External Data

The canonical source for all data is [landscape.yml](landscape.yml). Once a day, we download data for projects and companies from the following sources:

* Project info from GitHub
* Market cap data from Yahoo Finance

The update server enhances the source data with the fetched data and saves the result in [processed_landscape.yml](processed_landscape.yml). The app loads a JSON representation of processed_landscape.yml to display data.

## License

The project is licenced under the Apache License, Version 2.0, except for project and product logos, which are generally copyrighted by the company that created them, and are simply cached here for reliability. The trail map, static landscape, serverless landscape, and [landscape.yml](landscape.yml) file are alternatively available under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/).

## Formats

The Azure Data Platform Landscape is available in these formats:

* [PNG](https://landscape.dataplatformschool.com/images/landscape.png)
* [PDF](https://landscape.dataplatformschool.com/images/landscape.pdf)

## Installation

You can install and run locally with the [install directions](INSTALL.md). It's not necessary to install locally if you just want to edit [landscape.yml](landscape.yml). You can do so via the GitHub web interface.

## Vulnerability reporting

Please open an [issue](https://github.com/valdasm/data-platform-landscape/issues/new) or, for sensitive information, email valdas@maksimavicius.eu.

## Adjusting the Landscape View
The file src/components/MainContent2.js describes the key elements of a
landscape big picture. It specifies where to put these sections: App Definition
and Development, Orchesteration & Management, Runtime,  Provisioning, Cloud,
    Platform, Observability and Analyzis, Special. Also it specifies where to
    locate the link to the serverless preview and an info with a QR code.

All these elements should have `top`, `left`, `width` and `height` properties to
position them. `rows` and `cols` specify how much columns or rows we expect in a
given horizontal or vertical section. 

When we see that those elements can not fit the sections, we need to either increase
the width of all the horizontal sections, or increase height and amount of rows
in a single horitzontal section and adjust the position of sections below.

Beside that, we have to adjust the width of a parent div (1620), the width in a
`src/components/BigPicture/FullscreenLandscape.js` (1640) and the width in a
`tools/renderLandscape.js` (6560, because of x4 zoom and margins)

Sometimes the total height is changed too, then we need to adjust the height the
same way as we adjust the width.

We have an experimental `fitWidth` property, it is good when you want to get rid of
an extra space on the right of a section.

The best way to test that layout is ok, is to visit `/landscape`, and if it looks ok, run `PORT=3000 babel-node
tools/renderLandscape` and see the rendered png files, they are in src/images folder.
