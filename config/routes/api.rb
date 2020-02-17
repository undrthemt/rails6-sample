# API grapeおよびgrape-swagger
# swaggerを上に記述して、base.rbにroute :anyを記述できるようにしています
mount GrapeSwaggerRails::Engine => '/swagger'
mount Api::Base => '/api'