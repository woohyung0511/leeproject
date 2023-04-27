package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReboardDto")
public class ReboardDto {

	private int num;
	private int readcount;
	private int likes;
	private int regroup;
	private int restep;
	private int relevel;
	private String id;
	private String name;
	private String subject;
	private String photo;
	private String content;
	private Timestamp writeday;
}
