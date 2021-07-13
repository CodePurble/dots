* `.` - Match any one character
* `*` - Match any number of previous character (including 0)
* `+` - Match any number of previous character (> 0)
* `$` - End of the line (usage- a$ - ends with "a")
* `^` - Beginning of the line (usage- ^ab - begins with "ab")
* `\S` - Match any non-whitespace character
* `\s` - Match any whitespace character
* `?` - Previous character is optional when matching
* `[a-z]` - Any lcase character from a-z
	* For ucase `[A-Z]`
	* case insensitive `[A-Za-z]`
* `[0-9]` - Match any digits
	* `[a-b]` - Match list from "a" to "b"
	* Can be used for letters as well
* `[aeiou]` - Matches a single character in the listed set
* `[^XYZ]` - Matches a sigle character NOT in the listed set
