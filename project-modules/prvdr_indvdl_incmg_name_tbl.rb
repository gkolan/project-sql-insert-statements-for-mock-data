# encoding: utf-8
module PrvdrIndvdlIncmgNameTbl
  	
    def self.insert_records(count)
    	 
    	  @count 			   = count
    	  @table_name 	 = "prvdr_indvdl_incmg_name_tbl"
    	  @primary_key 	 = "ID"
        @time_now     = Time.now.to_i

    	  puts "Working on #{@table_name}"

    	  # Get Last Record in Database
		    @last_id_before_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)
		    p @last_id_before_count
        # Insert Records
        File.open("#{@table_name}_#{@time_now}.txt", "w") do |file|
        for k in 1..@count
            @ID                       = (k + @last_id_before_count.to_i).to_s
            @PRVDR_LAST_UPDT_DT       = ProjectMockData.last_updated_date_yyyy_mm_dd()
            @PRVDR_INDVDL_LAST_NAME   = Faker::Name.last_name.gsub(/[^0-9A-Za-z]/, '')
            @PRVDR_INDVDL_1ST_NAME    = Faker::Name.first_name.gsub(/[^0-9A-Za-z]/, '')
            @PRVDR_INDVDL_MDL_NAME    = Faker::Name.first_name.gsub(/[^0-9A-Za-z]/, '')
            @PRVDR_INDVDL_PREX_NAME   = ["Dr","Dr","Dr","--","--","--","--","--"].sample
            @PRVDR_INDVDL_SFX_NAME    = ["--","--","--","--","--","--","--","I","II","III","IV"].sample
            @PRVDR_INDVDL_CRDNTL_NAME = ["PhD","MD","MS","RPT","PA"].sample
            @PRVDR_ID                 = Luhnacy.generate(10).to_s
            @PRVDR_NAME_TYPE_CD       = "6"
            @PRVDR_NAME_LAST_UPDT_DT  = ProjectMockData.last_updated_date_yyyy_mm_dd()
            @PRVDR_MAX_UPDT_DT        = ProjectMockData.last_updated_date_yyyy_mm_dd()
      
            file.write("INSERT INTO 'Project_INC'.'PRVDR_INDVDL_INCMG_NAME_TBL' (PRVDR_LAST_UPDT_DT, PRVDR_INDVDL_LAST_NAME, PRVDR_INDVDL_1ST_NAME, PRVDR_INDVDL_MDL_NAME, PRVDR_INDVDL_PREX_NAME, PRVDR_INDVDL_SFX_NAME, PRVDR_INDVDL_CRDNTL_NAME, PRVDR_ID, PRVDR_NAME_TYPE_CD, PRVDR_NAME_LAST_UPDT_DT, PRVDR_MAX_UPDT_DT) VALUES (TO_DATE('#{@PRVDR_LAST_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_INDVDL_LAST_NAME}', '#{@PRVDR_INDVDL_1ST_NAME}', '#{@PRVDR_INDVDL_MDL_NAME}', '#{@PRVDR_INDVDL_PREX_NAME}', '#{@PRVDR_INDVDL_SFX_NAME}', '#{@PRVDR_INDVDL_CRDNTL_NAME}', '#{@PRVDR_ID}', '6', TO_DATE('#{@PRVDR_NAME_LAST_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('#{@PRVDR_MAX_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));\n")

            $MySQL2_Client.query("INSERT INTO prvdr_indvdl_incmg_name_tbl 
              (ID,PRVDR_LAST_UPDT_DT,PRVDR_INDVDL_LAST_NAME,PRVDR_INDVDL_1ST_NAME,PRVDR_INDVDL_MDL_NAME,PRVDR_INDVDL_PREX_NAME,PRVDR_INDVDL_SFX_NAME,PRVDR_INDVDL_CRDNTL_NAME,PRVDR_ID,PRVDR_NAME_TYPE_CD,PRVDR_NAME_LAST_UPDT_DT,PRVDR_MAX_UPDT_DT) VALUES ('#{@ID}','#{@PRVDR_LAST_UPDT_DT}','#{@PRVDR_INDVDL_LAST_NAME}','#{@PRVDR_INDVDL_1ST_NAME}','#{@PRVDR_INDVDL_MDL_NAME}','#{@PRVDR_INDVDL_PREX_NAME}','#{@PRVDR_INDVDL_SFX_NAME}','#{@PRVDR_INDVDL_CRDNTL_NAME}','#{@PRVDR_ID}','6','#{@PRVDR_NAME_LAST_UPDT_DT}','#{@PRVDR_MAX_UPDT_DT}')" )

            puts "Success! #{@table_name}, #{@primary_key} : #{@ID}"
      
        end
      end

   		  # Get Last Record in Database
		    @last_id_after_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)

		    # Summary
   		  puts "*** #{@table_name} Summary ***"
   	  	puts "ID before Count: #{@last_id_before_count}"
   		  puts "Count: #{@count}"
   		  puts "ID after Count: #{@last_id_after_count}"
   		  puts "* * * * * *"
   		  puts
  	end
end

=begin
'#{@ID}','#{@PRVDR_LAST_UPDT_DT}','#{@PRVDR_INDVDL_LAST_NAME}','#{@PRVDR_INDVDL_1ST_NAME}','#{@PRVDR_INDVDL_MDL_NAME}','#{@PRVDR_INDVDL_PREX_NAME}','#{@PRVDR_INDVDL_SFX_NAME}','#{@PRVDR_INDVDL_CRDNTL_NAME}','#{@PRVDR_ID,PRVDR_NAME_TYPE_CD}','#{@PRVDR_NAME_LAST_UPDT_DT}','#{@PRVDR_MAX_UPDT_DT}'
=end