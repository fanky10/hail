# hail

Hail is a command for publishing android builds to HockeyApp.
Because for playing hockey first you need some snow, right?

This is not intended for production Continuous Delivery (but it may work), it's just a home made script. If you are a devOp and know way better scripting than I do (of course you will), feel free to suggest / contribute.

## Getting started

For now it's just a simple script file intended to be run locally.

### Prerequisites

This script file depends on:
- [shyaml](https://github.com/0k/shyaml) for parsing config file
- [jq](https://github.com/stedolan/jq) to prettify the curl upload response.

### Installing

- Clone the repo

- Add dependencies: 
```bash
$ brew install shyaml
$ brew install jq
```

- Configure config.yml with proper params and move to user defined configuration

```bash
$ mkdir ~/.config/hail/
$ cp config.yml ~/.config/hail/
```

- Add execution access: 

`$ chmod +x hail.sh`

- Add alias to user binaries

`$ ln -s /path/to/hail/hail.sh /usr/local/bin/hail`

### Running
`$ hail -v -b -r -f release_build_type -c /path/to/config.yaml`

Where:
- v: verbose
- b: execute build
- r: execute release
- f: build type name (optional)
- c: yaml config file (optional)

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

This project is licensed under the BSD 2-Clause "Simplified" License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to stackoverflow for teaching me how to write bash script files (:
* Inspiration on daily deployment days and maintaining different app flavors
