# encoding: utf-8
module PrvdrOthrIdTbl
  	
    def self.insert_records(count)
    	 
    	  @count 			   = count
    	  @table_name 	 = "prvdr_othr_id_tbl"
    	  @primary_key 	 = "ID"
        @time_now     = Time.now.to_i

    	  puts "Working on #{@table_name}"

    	  # Get Last Record in Database
		    @last_id_before_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)
		    p @last_id_before_count
        # Insert Records
        File.open("#{@table_name}_#{@time_now}.txt", "w") do |file|
        for k in 1..@count
            @ID                           = (k + @last_id_before_count.to_i).to_s
            @PRVDR_SRC_ID                 = ["04102","04102","04102","04102","04102","04102","11202","11202","NPPES"].sample
            @PRVDR_ID                     = Luhnacy.generate(10).to_s
            @PRVDR_CREATN_TMESTMP         = ProjectMockData.last_updated_timestamp
            @PRVDR_OTHR_ID                = ProjectMockData.alpha_numeric_number()
            @PRVDR_TYPE_ID_CD             = (02..14).to_a.sample
            
            file.write("INSERT INTO 'Project_STG'.'PRVDR_OTHR_ID_TBL' (PRVDR_SRC_ID, PRVDR_ID, PRVDR_CREATN_TMESTMP, PRVDR_OTHR_ID, PRVDR_TYPE_ID_CD) VALUES ('#{@PRVDR_SRC_ID}', '#{@PRVDR_ID}', TO_TIMESTAMP('#{@PRVDR_CREATN_TMESTMP} 19:39:29.052000000', 'YYYY-MM-DD HH24:MI:SS.FF'), '#{@PRVDR_OTHR_ID}', '#{@PRVDR_TYPE_ID_CD}');\n")

            $MySQL2_Client.query("INSERT INTO prvdr_othr_id_tbl 
              (ID,PRVDR_SRC_ID,PRVDR_ID,PRVDR_CREATN_TMESTMP,PRVDR_OTHR_ID,PRVDR_TYPE_ID_CD) VALUES ('#{@ID}','#{@PRVDR_SRC_ID}','#{@PRVDR_ID}','#{@PRVDR_CREATN_TMESTMP}','#{@PRVDR_OTHR_ID}','#{@PRVDR_TYPE_ID_CD}')" )

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