# Ruby Gems
require "faker"
require "faker/medical"
require 'luhnacy'

# Dir["/path/to/directory/*.rb"].each {|file| require file }
# Local Modules
require "./project-modules/mysql_database"
require "./project-modules/project_mock_data"
require "./project-modules/prvdr_indvdl_id_tbl"
require "./project-modules/prvdr_indvdl_incmg_id_tbl"
require "./project-modules/prvdr_indvdl_incmg_name_tbl"
require "./project-modules/prvdr_indvdl_incmg_othr_id_tbl"
require "./project-modules/prvdr_othr_id_tbl"
require "./project-modules/prvdr_indvdl_name_tbl"

# Connect to MYSQL
#MysqlDatabase.start_connection("localhost","root","company","projectdb1")

#Insert Data
PrvdrIndvdlIdTbl.insert_records(20)
PrvdrIndvdlIncmgIdTbl.insert_records(20)
PrvdrIndvdlIncmgNameTbl.insert_records(20)
PrvdrIndvdlIncmgOthrIdTbl.insert_records(20)
PrvdrOthrIdTbl.insert_records(20)
PrvdrIndvdlNameTbl.insert_records(20)