default:

    formatters:
        html:
            output_path: %paths.base%/report
    extensions:
        Behat\MinkExtension:
            base_url: https://stage.reviewbuzz.com
            default_session: selenium2
            goutte: ~
            selenium2: ~
            browser_name: 'chrome'
        IntegratedExperts\BehatScreenshotExtension:
            dir: %paths.base%/screenshots
            fail: true
            purge: true   
        emuse\BehatHTMLFormatter\BehatHTMLFormatterExtension:
            name: html
            renderer: Twig
            file_name: Report
            print_args: true
            print_outp: true
            loop_break: true            