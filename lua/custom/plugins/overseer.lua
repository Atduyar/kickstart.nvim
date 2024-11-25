return {
  'stevearc/overseer.nvim',
  dependencies = {
    'mfussenegger/nvim-dap',
    'folke/trouble.nvim',
  },
  opts = {
    component_aliases = {
      -- Most tasks are initialized with the default components
      default = {
        { 'display_duration', detail_level = 2 },
        'on_output_summarize',
        'on_exit_set_status',
        'on_complete_notify',
        { 'on_complete_dispose', require_view = { 'SUCCESS', 'FAILURE' } },
      },
      -- Tasks from tasks.json use these components
      default_vscode = {
        'default',
        'on_output_quickfix',
        'on_result_diagnostics',
        -- 'on_result_diagnostics_trouble',
      },
    },
  },
}
