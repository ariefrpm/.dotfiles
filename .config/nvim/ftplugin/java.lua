local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
  --  cmd = { '/Users/ariefirwansyah/Downloads/jdt-language-server-latest/bin/jdtls' },
  cmd = {

    -- 💀
    '/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin/java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    --'-javaagent:/Users/ariefirwansyah/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar',
    '-javaagent:/Users/ariefirwansyah/Downloads/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED',
    --'--add-opens',
    --'jdk. compiler/com.sun.tools.javac.model=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com. sun.tools.javac.processing=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED',
    --'--add-opens',
    --'jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED',
    -- 💀
    --'-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
    '-jar',
    '/Users/ariefirwansyah/Downloads/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.6.800.v20240426-1701.jar',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    '-configuration',
    '/Users/ariefirwansyah/Downloads/jdt-language-server-latest/config_mac',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.
    -- tes
    -- 💀
    -- See `data directory configuration` section in the README
    '-data',
    --workspace_dir,
    '/Users/ariefirwansyah/javaproject',
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
  settings = {
    ['java.format.settings.url'] = '/Users/ariefirwansyah/Downloads/intellij-java-google-style.xml',
    ['java.format.settings.profile'] = 'GoogleStyle',
    java = {
      home = '/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin/java',
      eclipse = {
        downloadSources = true,
      },
      gradle = {
        enabled = true,
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
        },
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {
          {
            name = 'JavaSE-17',
            path = '/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/',
          },
          {
            name = 'JavaSE-21',
            path = '/Library/Java/JavaVirtualMachines/liberica-jdk-21.jdk/Contents/Home/',
          },
          {
            name = 'JavaSE-11',
            path = '/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home/',
          },
        },
        maven = {
          userSettings = '/Users/ariefirwansyah/javaproject/' .. project_name .. '/settings.xml',
          globalSettings = '/Users/ariefirwansyah/javaproject/' .. project_name .. '/settings.xml',
        },
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all', -- literals, all, none
        },
      },
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*',
        },
        importOrder = {
          'java',
          'javax',
          'com',
          'org',
        },
      },
    },
    signatureHelp = { enabled = true },
  },
}
require('jdtls').start_or_attach(config)
