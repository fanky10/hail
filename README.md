# hail

Hail command line for publishing android builds to HockeyApp. Because for hockey first you need some snow, right?
This is not intended for production Continuous Delivery (but it may work), it's just a home made script. If you are a devOp and know way better scripting than I do (of course you will), feel free to suggest / contribute.

## Getting started

For now it's just a simple script file which you can run it locally for now. Clone the repo, add proper access +x to hail.sh

### Prerequisites

This script file depends on: shyaml for parsing config file and jq to prettify the curl upload response. If you don't like to prettify we can add it as optional with a pretty flag, feel free to collaborate (see collaboration section for more details).

### Installing

- Clone the repo

- Add execution access: 

`$ chmod +x hail.sh`

- Add dependencies: 

`$ brew install shyaml`

`$ brew install jq`


### Running
`$ ./hail.sh -vbr -f flavor_a -c myConfig.yaml`

Where:
- v: verbose
- b: build
- r: release
- f: flavor name
- c: specific yaml. Default config.yaml

## Contributing

Create an issue as you see fit, I will work on them or reject them depending on the importance of the feature or bug.
I have some ideas on my own tracked as [issues](https://github.com/fanky10/hail/issues)

The process for submitting pull requests is really simple, add issue number and description, submit the PR, I will review, add comments and merge.

## Versioning

I use [SemVer](http://semver.org/) for versioning. There is no version available at the moment but when I feel confortable enough with 1.0.0 I will add it. Find [tags on this repository](https://github.com/fanky10/hail/tags). 

## Authors

* **Ewen** - *Idea and initial work* - [fanky10](https://github.com/fanky10)

See also the list of [contributors](https://github.com/fanky10/hail/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to stackoverflow for teaching me how to write bash script files (:
* Inspiration on daily deployment days and maintaining different app flavors
