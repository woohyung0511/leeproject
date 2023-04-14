package board.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name = "jboard")
@Data
public class BoardDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long num;
	@Column(name = "writer",updatable = false)
	private String writer;
	@Column
	private String subject;
	@Column
	private String content;
	@Column
	private String photo;
	@CreationTimestamp
	@Column(name="writeday",updatable = false)
	private Timestamp writeday;
}
