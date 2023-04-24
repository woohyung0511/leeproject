package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("BoardDto")
public class BoardDto {

	private String num;
	private String name;
	private String myid;
	private String subject;
	private String content;
	private String uploadfile;
	private MultipartFile upload;
	private int readcount;
	private Timestamp writeday;	
}
