# :material-language-markdown: Markdown Report

![osmedeus-markdown-1](/static/images/osmedeus-markdown-1.png){ loading=lazy }

![osmedeus-markdown-2](/static/images/osmedeus-markdown-2.png){ loading=lazy }


## Basic Information

The default storage location for all markdown templates, along with the default CSS style, is `$HOME/osmedeus-base/data/markdown/`
To generate the HTML report, utilize the script provided within the following workflow.

```yaml
GenMarkdownReport("{{Data}}/markdown/general-template.md", "{{Output}}/summary.html")
```

## Special tags

### `<content />` tag
The content tag is employed to display the file's content using the `src` attribute. Additionally, by utilizing the `shortent=true` attribute, you can make the content collapsible.

```markdown
<content src="{{Output}}/subdomain/final-{{Workspace}}.txt" shorten=true />

<content src="{{Output}}/linkfinding/links-{{Workspace}}.txt" />
```

***

### `<scanInfo />` tag

The scanInfo tag is utilized to generate scan information such as the target name, asset summary, and workflow name.


### `<reports />` tag

The reports tag is employed to list all files within the `report:` section specific to the module.
