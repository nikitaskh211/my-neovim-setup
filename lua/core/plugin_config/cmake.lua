-- Import necessary modules
local async = require('plenary.async')

-- Check if the plugin is installed
local ok, cmake_tools = pcall(require, 'cmake-tools')

if not ok then
    error("The 'cmake-tools' plugin is not installed. Please make sure it's installed properly.")
end

-- Set up the configuration for cmake-tools
cmake_tools.setup {
    cmake_command = 'cmake',  -- Path to cmake command
    ctest_command = 'ctest',  -- Path to ctest command
    cmake_regenerate_on_save = true,  -- Auto-generate when saving CMakeLists.txt
    cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' },  -- Options for CMakeGenerate
    cmake_build_options = {},  -- Options for CMakeBuild
    cmake_build_directory = 'out/${variant:buildType}',  -- Directory for cmake build
    cmake_soft_link_compile_commands = true,  -- Create a soft link to the compile commands file
    cmake_compile_commands_from_lsp = false,  -- Set compile commands file location using LSP
    cmake_kits_path = nil,  -- Path to global cmake kits
    cmake_variants_message = {
        short = { show = true },  -- Show short message for cmake variants
        long = { show = true, max_length = 40 },  -- Show long message for cmake variants
    },
    cmake_dap_configuration = {
        name = 'cpp',
        type = 'codelldb',
        request = 'launch',
        stopOnEntry = false,
        runInTerminal = true,
        console = 'integratedTerminal',
    },
    cmake_executor = {
        name = 'quickfix',
        opts = {},
        default_opts = {
            quickfix = {
                show = 'always',
                position = 'belowright',
                size = 10,
                encoding = 'utf-8',
                auto_close_when_success = true,
            },
        },
    },
    cmake_runner = {
        name = 'terminal',
        opts = {},
        default_opts = {
            terminal = {
                name = 'Main Terminal',
                prefix_name = '[CMakeTools]: ',
                split_direction = 'horizontal',
                split_size = 11,
                single_terminal_per_instance = true,
                single_terminal_per_tab = true,
                keep_terminal_static_location = true,
                start_insert = false,
                focus = false,
                do_not_add_newline = false,
            },
        },
    },
    cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { '⠋', "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        refresh_rate_ms = 100,
    },
}

-- Return the configuration
return {}
