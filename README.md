**FAIRINO Lua Library**

A Lua library for FAIRINO robot controllers, designed to improve code development in Visual Studio Code.

**Purpose:**
This library provides function definitions and documentation for FAIRINO robot commands. It helps you write Lua programs with IntelliSense, autocomplete, parameter hints, and hover documentation.
The goal is to make FAIRINO Lua programming easier and reduce errors when using robot functions.

**Features:**
- Function definitions for FAIRINO robot commands.
- IntelliSense and autocomplete.
- Parameter hints while writing function calls.
- Hover documentation with parameter descriptions and examples.

**Project Structure:**
Keep your robot programs in the *Fairino Code* folder.

Project/
├── library/
│   └── FAIRINO function definitions
├── Fairino Code/
│   └── > Your cobot programs
└── .vscode/
    └── settings.json

library/ contains the function definitions used by Visual Studio Code for code completion and documentation.

Fairino Code/ is where you create and maintain your FAIRINO Lua programs.

.vscode/settings.json contains the editor settings required for the library.

**Usage:**
- Clone or download this repository.
- Open the project folder in Visual Studio Code.
- Create your FAIRINO Lua programs inside the Fairino Code folder.
- Use autocomplete and parameter hints when writing robot commands.
- Hover over supported functions to view their documentation.

**Important:**
This library provides editor support only. It does not replace the official FAIRINO controller documentation.
Always verify your programs and test them before running them on a real robot.

**Compatibility:**
Designed for use with FAIRINO robot controllers and Visual Studio Code with the Lua Language Server extension. ( https://marketplace.visualstudio.com/items?itemName=sumneko.lua )

**Contributions:**
Suggestions, corrections, and additional function definitions are welcome. Contributions can help expand the library and improve its documentation.
