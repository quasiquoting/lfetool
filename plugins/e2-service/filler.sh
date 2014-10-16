fill_e2_service_files () {
    # master make file for e2 projects
    template="plugins/e2-service/templates/Makefile.tmpl"
    pattern="{{E2MAKEFILE}}"
    fill_tool_var $template $pattern
    # otp make include
    template="plugins/e2-service/templates/e2.mk.tmpl"
    pattern="{{E2MK}}"
    fill_tool_var $template $pattern
    # app.src file
    template="plugins/e2-service/templates/PROJECT.app.src.tmpl"
    pattern="{{E2APPSRC}}"
    fill_tool_var $template $pattern
    # test module
    template="plugins/e2-service/templates/PROJECT-tests.lfe.tmpl"
    pattern="{{E2TESTMODULE}}"
    fill_tool_var $template $pattern
    # server module
    template="plugins/e2-service/templates/PROJECT-server.lfe.tmpl"
    pattern="{{E2SERVER}}"
    fill_tool_var $template $pattern
    # app
    template="plugins/e2-service/templates/PROJECT-app.lfe.tmpl"
    pattern="{{E2APP}}"
    fill_tool_var $template $pattern
    # rebar config file
    template="plugins/e2-service/templates/rebar.config.tmpl"
    pattern="{{E2REBAR}}"
    fill_tool_var $template $pattern
}
