module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    include ApiV0::ExceptionHandlers

    mount Ping
    mount Orders

    add_swagger_documentation(
      mount_path: 'swagger_doc',
      hide_format: true,
      hide_documentation_path: true
    )
  end
end