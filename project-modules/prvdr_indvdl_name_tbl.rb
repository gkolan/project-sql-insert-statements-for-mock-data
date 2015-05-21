# encoding: utf-8
module PrvdrIndvdlNameTbl
  	
    def self.insert_records(count)
    	 
    	  @count 			   = count
    	  @table_name 	 = "prvdr_indvdl_name_tbl"
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
            @PRVDR_SRC_ID             = ["00951","05535","00951","05535","00951","00951","00951","00951"].sample
            @PRVDR_ID                 = Luhnacy.generate(9).to_s
            @PRVDR_CREATN_TMESTMP     = ["2010-10-08","2010-10-08","2010-10-08","2010-10-08","2007-08-31"].sample
            @PRVDR_NAME_TYPE_CD       = "6"
            @PRVDR_INDVDL_NAME_SQNC   = (27843762 + k).to_s
            @PRVDR_INDVDL_LAST_NAME   = Faker::Name.last_name.gsub(/[^0-9A-Za-z]/, '')
            @PRVDR_INDVDL_1ST_NAME    = Faker::Name.first_name.gsub(/[^0-9A-Za-z]/, '')
            @PRVDR_INDVDL_MDL_NAME    = ('A'..'Z').to_a.sample
            @PRVDR_INDVDL_PREX_NAME   = ["Dr","Dr","Dr","--","--","--","--","--"].sample
            @PRVDR_INDVDL_SFX_NAME    = ["--","--","--","--","--","--","--","I","II","III","IV"].sample
            @PRVDR_INDVDL_CRDNTL_NAME = ["PhD","MD","MS","RPT","PA","","","","","","","","","",""].sample
            
            file.write("INSERT INTO 'Project_STG'.'PRVDR_INDVDL_NAME_TBL' (PRVDR_SRC_ID, PRVDR_ID, PRVDR_CREATN_TMESTMP, PRVDR_NAME_TYPE_CD, PRVDR_INDVDL_NAME_SQNC, PRVDR_INDVDL_LAST_NAME, PRVDR_INDVDL_1ST_NAME, PRVDR_INDVDL_MDL_NAME, PRVDR_INDVDL_PREX_NAME, PRVDR_INDVDL_SFX_NAME, PRVDR_INDVDL_CRDNTL_NAME) VALUES ('#{@PRVDR_SRC_ID}', '#{@PRVDR_ID}', TO_TIMESTAMP('#{@PRVDR_CREATN_TMESTMP} 19:39:29.052000000', 'YYYY-MM-DD HH24:MI:SS.FF'), '#{@PRVDR_NAME_TYPE_CD}', '#{@PRVDR_INDVDL_NAME_SQNC}', '#{@PRVDR_INDVDL_LAST_NAME}', '#{@PRVDR_INDVDL_1ST_NAME}', '#{@PRVDR_INDVDL_MDL_NAME}', '#{@PRVDR_INDVDL_PREX_NAME}', '#{@PRVDR_INDVDL_SFX_NAME}', '#{@PRVDR_INDVDL_CRDNTL_NAME}');\n")

            $MySQL2_Client.query("INSERT INTO prvdr_indvdl_name_tbl (ID,PRVDR_SRC_ID,PRVDR_ID,PRVDR_CREATN_TMESTMP,PRVDR_NAME_TYPE_CD,PRVDR_INDVDL_NAME_SQNC,PRVDR_INDVDL_LAST_NAME,PRVDR_INDVDL_1ST_NAME,PRVDR_INDVDL_MDL_NAME,PRVDR_INDVDL_PREX_NAME,PRVDR_INDVDL_SFX_NAME,PRVDR_INDVDL_CRDNTL_NAME) VALUES ('#{@ID}','#{@PRVDR_SRC_ID}','#{@PRVDR_ID}','#{@PRVDR_CREATN_TMESTMP}','#{@PRVDR_NAME_TYPE_CD}','#{@PRVDR_INDVDL_NAME_SQNC}','#{@PRVDR_INDVDL_LAST_NAME}','#{@PRVDR_INDVDL_1ST_NAME}','#{@PRVDR_INDVDL_MDL_NAME}','#{@PRVDR_INDVDL_PREX_NAME}','#{@PRVDR_INDVDL_SFX_NAME}','#{@PRVDR_INDVDL_CRDNTL_NAME}')")

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