# :octicons-code-24: Scripts

<p aligh="center">
A Script is an alias for the Golang function that you can call from YAML Workflow that allows you to do complex logic which is native support from the Osmedeus core engine.
</p>


<figure markdown> 
    ![scripts](/static/workflow/scripts.png)
</figure>

***

## Core Scripts

```golang
/* File to store all the script for better reference */

const (
	ExecCmd           = "ExecCmd"
	ExecCmdB          = "ExecCmdB"
	ExecCmdWithOutput = "ExecCmdWithOutput"
	ExecContain       = "ExecContain"
)

const (
    Sleep      = "Sleep"
    Exit       = "Exit"
    CastToInt  = "CastToInt"
    StripSlash = "StripSlash"
    Printf     = "Printf"
    Cat        = "Cat"
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