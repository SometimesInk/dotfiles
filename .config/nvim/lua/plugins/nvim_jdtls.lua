return {
  'mfussenegger/nvim-jdtls',
  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          {
            name = "JavaSE-8",
            path = "/usr/lib/jvm/java-8-openjdk/",
          },
          {
            name = "javaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk/",
          },
          {
            name = "javaSE-25",
            path = "/usr/lib/jvm/java-25-openjdk/",
          },
        }
      }
    }
  },
}
