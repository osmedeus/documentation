# :octicons-code-24: Scripts

<p aligh="center">
Script is an alias for the Golang function that you can call from YAML Workflow that allows you to do complex logic which native support from the Osmedeus core engine.
</p>


<figure markdown> 
    ![scripts](/static/workflow/scripts.png)
</figure>

***

```golang
/* File to store all the script for better reference */

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
	CleanJSONHttpx  = "CleanJSONHttpx"
)


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
)


```