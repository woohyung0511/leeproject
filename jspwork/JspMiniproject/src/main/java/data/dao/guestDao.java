package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.guestDto;
import mysql.db.DbConnect;

public class guestDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void insertGuest(guestDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into guest (myid,content,photoname,writeday) values (?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMyid());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPhotoname());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체 갯수
	public int getTotalCount()
	{
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from guest";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				n=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return n;
	}
	
	//페이지에서 필요한 만큼만 리턴
	public List<guestDto> getList(int start,int perpage)
	{
		List<guestDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from guest order by num desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				guestDto dto=new guestDto();
				
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				dto.setChu(rs.getInt("chu"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//num에 해당하는 dto반환
	public guestDto getData(String num)
	{
		guestDto dto=new guestDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from guest where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				dto.setChu(rs.getInt("chu"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//수정
	public void updateGuest (guestDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update guest set content=?,photoname=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getPhotoname());
			pstmt.setString(3, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//삭제
	public void deleteGuest(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from guest where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "num");
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//추천을 클릭하면 추천 수 증가 시키기(ajax)
	
	public void updateChu(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update guest set chu=chu+1 where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
