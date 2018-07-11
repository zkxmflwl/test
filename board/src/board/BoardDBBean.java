package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
		
		//�̱���
		private static BoardDBBean instance = new BoardDBBean();
		//instance��ü����
		public static BoardDBBean getInstance() {
			return instance;
		}
		
		//Ŀ�ؼ�
		private Connection getConnection() throws Exception{
			Context init = new InitialContext();
	  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
	  		return ds.getConnection();
		}
		
		//�ڷ� �ֱ�
		public int insert(BoardDataBean board) {
			int result=0;
			Connection con = null;
			PreparedStatement psmt = null;
			
			try {
				con = getConnection();
				
				String sql = "insert into board0 values(board0_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?)";
				psmt=con.prepareStatement(sql);
				psmt.setString(1, board.getWriter());
				psmt.setString(2, board.getEmail());
				psmt.setString(3, board.getSubject());
				psmt.setString(4, board.getPasswd());
				psmt.setInt(5, 0);
				psmt.setString(6, board.getContent());
				psmt.setString(7, board.getIp());
				
				result=psmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				if(psmt!=null)try {psmt.close();}catch(Exception e) {};
				if(con!=null)try {con.close();}catch(Exception e) {};
			}
			
			return result;
			
		}
		
		//�� �ڷ� ���� ���ϱ�
		public int getCount() {
			int result=0;
			Connection con = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				
				String sql = "select count(*) from board0";
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					result=rs.getInt("count(*)");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();}catch(Exception e) {};
				if(psmt!=null)try {psmt.close();}catch(Exception e) {};
				if(con!=null)try {con.close();}catch(Exception e) {};
			}
			
			return result;
		}
		
		//���� �������� ������ �ڷ� ���ϱ�
		public List<BoardDataBean> getList(int start, int end){
			List<BoardDataBean> list =new ArrayList<BoardDataBean>();
			Connection con =null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
			
				String sql = "select *  from (select rownum rnum, num, writer, email, subject, passwd, reg_date, readcount, content, ip from"
						+ "(select *from board0 order by num desc)) where rnum>=? and rnum<=?";
				
				psmt= con.prepareStatement(sql);
				psmt.setInt(1, start);
				psmt.setInt(2, end);
				rs=psmt.executeQuery();
				while (rs.next()) {
					BoardDataBean db = new BoardDataBean();
					db.setNum(rs.getInt("num"));
					db.setWriter(rs.getString("writer"));
					db.setEmail(rs.getString("email"));
					db.setSubject(rs.getString("subject"));
					db.setPasswd(rs.getString("passwd"));
					db.setReg_date(rs.getTimestamp("reg_date"));
					db.setReadcount(rs.getInt("readcount"));
					db.setIp(rs.getString("ip"));
					list.add(db);
				};
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();}catch(Exception ee) {};
				if(psmt!=null)try {psmt.close();}catch(Exception ee) {};
				if(con!=null)try {con.close();}catch(Exception ee) {};
			}
			
			
			return list;
		}

		//������ ������(��ȸ�� ����+1�� �ۿ� ���� ������)
		public BoardDataBean updateCount(int num) {
			BoardDataBean db = new BoardDataBean();
			Connection con = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				
				String  sql= "update board0 set readcount=readcount+1 where num=?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				psmt.executeUpdate();
				psmt.close();
				
				sql ="select * from board0 where num=?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs=psmt.executeQuery();
				
				if(rs.next()) {
					db.setNum(rs.getInt("num"));
					db.setWriter(rs.getString("writer"));
					db.setEmail(rs.getString("email"));
					db.setSubject(rs.getString("subject"));
					db.setPasswd(rs.getString("passwd"));
					db.setReg_date(rs.getTimestamp("reg_date"));
					db.setReadcount(rs.getInt("readcount"));
					db.setContent(rs.getString("content"));
					db.setIp(rs.getString("ip"));
					
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();}catch(Exception ee) {};
				if(psmt!=null)try {psmt.close();}catch(Exception ee) {};
				if(con!=null)try {con.close();}catch(Exception ee) {};
			}
			
			
			return db;
		}

		//�ۼ����� ������ �ҷ�����
		public  BoardDataBean getContent(int num) {
			BoardDataBean db = new BoardDataBean();
			Connection con = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();

				String sql ="select * from board0 where num=?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs=psmt.executeQuery();
				
				if(rs.next()) {
					db.setNum(rs.getInt("num"));
					db.setWriter(rs.getString("writer"));
					db.setEmail(rs.getString("email"));
					db.setSubject(rs.getString("subject"));
					db.setPasswd(rs.getString("passwd"));
					db.setReg_date(rs.getTimestamp("reg_date"));
					db.setReadcount(rs.getInt("readcount"));
					db.setContent(rs.getString("content"));
					db.setIp(rs.getString("ip"));
					
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();}catch(Exception ee) {};
				if(psmt!=null)try {psmt.close();}catch(Exception ee) {};
				if(con!=null)try {con.close();}catch(Exception ee) {};
			}
			
			return db;
		}

		//�� �����ϱ�
		public void update(BoardDataBean board){
			
			Connection con = null;
			PreparedStatement psmt = null;
			
			try {
				con = getConnection();
				
				String sql = "update board0 set writer=?, email=?, subject=?,  content=?, ip=? where num=?";
				psmt=con.prepareStatement(sql);
				psmt.setString(1, board.getWriter());
				psmt.setString(2, board.getEmail());
				psmt.setString(3, board.getSubject());
				psmt.setString(4, board.getContent());
				psmt.setString(5, board.getIp());
				psmt.setInt(6, board.getNum());
				psmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				if(psmt!=null)try {psmt.close();}catch(Exception e) {};
				if(con!=null)try {con.close();}catch(Exception e) {};
			}
		}
		
		//�� �����ϱ�
		public void delete(BoardDataBean board){
			
			Connection con = null;
			PreparedStatement psmt = null;
			
			try {
				con = getConnection();
				
				String sql = "delete from board0 where num=?";
				psmt=con.prepareStatement(sql);
				psmt.setInt(1, board.getNum());
				psmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				if(psmt!=null)try {psmt.close();}catch(Exception e) {};
				if(con!=null)try {con.close();}catch(Exception e) {};
			}
		}
		
		
		
}
