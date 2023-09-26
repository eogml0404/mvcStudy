package app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import app.dbconn.DbConn;
import app.domain.CommentVo;
import app.domain.MemberVo;

public class CommentDao {
	
		//멤버변수 선언하고 전역으로 활용한다
		private Connection conn;  //멤버변수는 선언만해도 자동초기화됨
		private PreparedStatement pstmt;
			
		//생성자를 만든다 DB연결
		public CommentDao() {
			DbConn dbconn = new DbConn();
			this.conn = dbconn.getConnection();
		}	
	
		public ArrayList<CommentVo>  commentSelectAll(){
			//무한배열클래스 객체생성해서 데이터를 담을 준비를 한다
			ArrayList<CommentVo> alist =new ArrayList<CommentVo>();
			ResultSet rs = null;
			String sql="select * from comment0803 where delyn='N' order by cidx desc";
			try{
				//1.창고(컬렉션)를 만든다
				//2.쿼리를 실행해서 데이터를 전용객체에 담아온다 
				//3.전용객체에 있는 데이터를 회원객체(MemberVo)에 옮겨담는다 
				//4.회원객체를 창고(컬렉션)에 집어넣는다	
				
				//구문(쿼리)객체
				pstmt = conn.prepareStatement(sql);
				//DB에 있는 값을 담아오는 전용객체
				rs = pstmt.executeQuery();
				//rs.next()는 다음값이 있는지 확인하는 메소드 있으면true
				while(rs.next()){
					CommentVo cv = new CommentVo();
					//rs에서 midx값 꺼내서 mv에 옮겨담는다
					cv.setCidx(rs.getInt("cidx"));
					cv.setMidx(rs.getInt("midx"));
					cv.setBidx(rs.getInt("bidx"));
					cv.setCwriter( rs.getString("cwriter") );
					cv.setCcontents( rs.getString("ccontents"));
					cv.setCwriteday( rs.getString("cwriteday"));
					alist.add(cv);
					//반복문 돌릴때마다 창고(컬렉션)에 추가해서 담는다
				}		
				
			}catch(Exception e){
				e.printStackTrace();		
			}finally{
				try{
					rs.close();
					pstmt.close();
					conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
			return alist;
		} 
		
		
		
		
		
	

}
