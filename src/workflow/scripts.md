# :octicons-code-24: Scripts

<p aligh="center">
A Script is an alias for the Golang function that you can call from YAML Workflow that allows you to do complex logic which is native support from the Osmedeus core engine.
</p>


<figure markdown> 
    ![scripts](/static/workflow/scripts.png)
</figure>

***



## Core Scripts

!!! info "Currently, I don't have time to fully document these scripts, but if you understand golang code you can read what it does from [**here**](https://github.com/j3ssie/osmedeus/blob/main/core/runtime.go#L106)"

```golang
/* File to store all the script for better reference */

const (
	ExecCmd           = "ExecCmd"
	ExecCmdB          = "ExecCmdB"
	ExecCmdWithOutput = "ExecCmdWithOutput"
	ExecContain       = "ExecContain"
)

const (
	SortU           = "SortU"
    SplitFile       = "SplitFile"
	Append          = "Append"
	Copy            = "Copy"
	CreateFolder    = "CreateFolder"
	DeleteFile      = "DeleteFile"
	DeleteFolder    = "DeleteFolder"
	SplitFileByPart = "SplitFileByPart"
	FileLength      = "FileLength"
	IsFile          = "IsFile"
	EmptyDir        = "EmptyDir"
	EmptyFile       = "EmptyFile"
	ReadLines       = "ReadLines"
)

const (
	SetVar   = "SetVar"
	GetOSEnv = "GetOSEnv"
)

const (
	Cleaning         = "Cleaning"
	CleanAmass       = "CleanAmass"
	CleanRustScan    = "CleanRustScan"
	CleanGoBuster    = "CleanGoBuster"
	CleanMassdns     = "CleanMassdns"
	CleanSWebanalyze = "CleanSWebanalyze"
	CleanJSONDnsx    = "CleanJSONDnsx"
	CleanWebanalyze  = "CleanWebanalyze"
	CleanArjun       = "CleanArjun"
	GenNucleiReport  = "GenNucleiReport"
	CleanJSONHttpx   = "CleanJSONHttpx"
)

```