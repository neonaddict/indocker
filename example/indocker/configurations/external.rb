Indocker
  .build_configuration(:dev)
  .use_registry(:dev, as: :default)
  .use_build_server(:external_bs)
  .enabled_containers(
    ruby: {
      servers: [:external],
    }
  )
