# Example WordPress Composer


This repository is a start state for a Composer-based WordPress workflow with Pantheon. It is meant to be copied by the the [Terminus Build Tools Plugin](https://github.com/pantheon-systems/terminus-build-tools-plugin) which will set up for you a brand new

* GitHub repo (Eventually Bitbucket, GitLab etc)
* Free Pantheon sandbox site
* An intermediary Continuous Integration service (CircleCI, eventually others) to run tests and push from the source repo (GitHub) to Pantheon.

For more background information on this style of workflow, see the [Pantheon documentation](https://pantheon.io/docs/guides/github-pull-requests/).


## Installation

To set up your own copy of this repository on GitHub (along with CircleCI configuration to push to a newly created Pantheon site) simply run the Terminus command `terminus build:project:create`:

```
terminus build:project:create pantheon-systems/example-wordpress-composer my-new-site --team="Agency Org Name"
```

The parameters shown here are:

* The name of the source repo, `pantheon-systems/example-wordpress-composer`. Do not change that parameter.
* The machine name to be used by both the soon-to-be-created Pantheon site and GitHub repo. Change `my-new-site` to something meaningful for you.
* The `--team` flag is optional and refers to a Pantheon organization. Pantheon organizations are often web development agencies or Universities. Setting this parameter causes the newly created site to go within the given organization. Run the Terminus command `terminus org:list` to see the organizations you are a member of. There might not be any.

#### Prerequisites

By running the command uou might get an error indicating that you don't have Terminus or the Terminus Build Tools plugin installed. Make sure you have

* [Created a Pantheon account](https://dashboard.pantheon.io/register)
* [Installed Terminus](https://pantheon.io/docs/terminus/install/)
* [Install the Build Tools Plugin](https://github.com/pantheon-systems/terminus-build-tools-plugin)

Additionally it is a good idea to set up a GitHub account and CircleCI account before running the command because you'll be asked for authentication tokens. You may find it easier to export those tokens as variables on your command line where the Build Tools Plugin can detect them automatically:

```
export GITHUB_TOKEN=[REDACTED]
export CIRCLE_TOKEN=[REDACTED]
```

## Important files and directories

#### `/web`

In this repository the `/web` directory is where the document root lives. When nginx looks for the website, it looks there.

#### `/web/wp`

Even within the `/web` directory you may notice that other directories and files are in different places compared to a normal version of WordPress core. See `/web/wp-config.php` for key settings like `WP_SITEURL` wich allows `wp-admin` to be relocated to `/web/wp/wp-admin`. The overall layout of directories in the repo is inspired by [Bedrock](https://github.com/roots/bedrock).

#### `composer.json`

If you are just browsing this repository on GitHub, you may not see some of the directories mentioned above like `wp-admin`. That is because WordPress core and its plugins are installed via Composer and ignored in the `.gitignore` file. Specific plugins are added to the project via `composer.json` and `composer.lock` keeps track of the exact version of each plugin (or other dependency). Generic Composer dependencies (not WordPress plugins or themes) are downloaded to the `/vendor` folder.

## Behat tests

So that CircleCI will have some test to run, this repository includes a configuration of [WordHat](https://wordhat.info/), A WordPress Behat extension. You can add your own `.feature` files within `/tests/behat/features`. [A fuller guide on WordPress testing with Behat is forthcoming.](https://github.com/pantheon-systems/documentation/issues/2469)
