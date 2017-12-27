package persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import domain.ManagerVO;
@Repository
public class TestDAOImpl implements TestDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.plantynet.warning_system.testMapper";

	@Override
	public ManagerVO test() {
		return (ManagerVO)sqlSession.selectOne(namespace+".test");
	}

	
//	Âü°í¿ë !!!!!!!!!!!!!
//	public void create(BoardVO vo) throws Exception {
//	    session.insert(namespace + ".create", vo);
//	  }
//
//	  @Override
//	  public BoardVO read(Integer bno) throws Exception {
//	    return session.selectOne(namespace + ".read", bno);
//	  }
//
//	  @Override
//	  public void update(BoardVO vo) throws Exception {
//	    session.update(namespace + ".update", vo);
//	  }
//
//	  @Override
//	  public void delete(Integer bno) throws Exception {
//	    session.delete(namespace + ".delete", bno);
//	  }
//
//	  @Override
//	  public List<BoardVO> listAll() throws Exception {
//	    return session.selectList(namespace + ".listAll");
//	  }
	
	
}
