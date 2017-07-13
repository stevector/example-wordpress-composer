# Example WordPress Composer


This repository is a start state for a Composer-based WordPress workflow with Pantheon. It is meant to be copied by the the Terminus Build Tools Plugin which will set up for you a brand new

1. GitHub Repo (Eventually Bitbucket, GitLab etc)
2. Free Pantheon sandbox site
3. An intermediary Continuous Integration service (CircleCI, eventually others) to push between the source repo (GitHub) and Pantheon.

For more background information on this style of workflow, see the [Pantheon documentation](https://pantheon.io/docs/guides/github-pull-requests/).


## Installation

To set up your own copy of this repository on GitHub (along with CircleCI configuration to push to a soon-to-be-created Pantheon site) simply run the Terminus command `terminus build:project:create`:

```
terminus build:project:create wordpress my-new-site --team="Agency Org Name"
```

The parameters shown here are:

* The name of the source repo. In this case `wordpress` is an alias for this repository, `pantheon-systems/example-wordpress-composer`. Do not change that parameter.
* The machine name to be used by both the soon-to-be-created Pantheon site and GitHub repo. Change `my-new-site` to something meaningful for you.
* The `--team` flag is optional and refers to a Pantheon organization. Pantheon organizations are often web development agencies or Universities. Setting this parameter causes the newly created site to go within the given organization. Run the Terminus command `terminus org:list` to see the organizations you are a member of. There might not be any.

#### Prerequisites

You might get an error indicating that you don't have Terminus or the Terminus Build Tools plugin installed.

* Creating a Pantheon account
* Installing Terminus
* Installing the Build Tools Plugin

Additionally it is a good idea to set up a GitHub account and CircleCI account before running the command because you'll be asked for authentication tokens. You may find it easier to export those tokens as variables on your command line where the Build Tools Plugin can detect them automatically:

```
export GITHUB_TOKEN=[REDACTED]
export CIRCLE_TOKEN=[REDACTED]
```

## Important files and directories

#### `/web`

In this repository the `/web` directory is where the document root lives. When nginx looks for the website, it looks there.

#### `/web/wp`

Even within the web directory you may notice that other directories and files are in different places compared to a version of WordPress core. The overall layout of directories in the repo is inspired by [Bedrock](https://github.com/roots/bedrock).



## Behat tests

@todo



## Related work

The structure of this repository is inspired by 

