package dao;

import com.mvc.model.BoardDAO;
import com.mvc.model.BoardDTO;
import org.junit.jupiter.api.Test;

public class BoardTests {
    @Test
    public void testBoardInsert(){
        BoardDAO boardDAO = BoardDAO.getInstance();
        for(int i = 1; i <=100; i++){
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setMemberId("test" + i);
        boardDTO.setSubject("제목" + i);
        boardDTO.setContent("내용" + i);
        boardDTO.setName("작성자" + i);
        boardDTO.setHit(1);
        boardDTO.setAddDate("2020-01-01");
        boardDAO.insertBoard(boardDTO);
        }
    }

    @Test //아래의 메서드는 테스트 코드라는 것을 알려주는 어노테이션
    public void testGetBoardByNum(){
        //테스트 메서드는 public void으로 시작하고 매개변수를 선언하지 않음
        int num = 1; //테이블에 존재하는 primary key.
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);
    }

    @Test
    public  void testBoardUpdate(){
        int num = 99;
        BoardDAO boardDAO = BoardDAO.getInstance();

        //변경전 데이터 출력
        BoardDTO boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);

        //변경
        BoardDTO board = new BoardDTO();
        boardDTO.setName("이민우");
        boardDTO.setSubject("제목 수정");
        boardDTO.setContent("내용 수정");
        boardDTO.setNum(num);
        boardDAO.updateBoard(boardDTO);

        //변경 후 데이터 출력
        boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);

    }

    @Test
    public void testBoardDelete(){
        int num = 4;
        BoardDAO boardDAO = BoardDAO.getInstance();

        //변경전 데이터 출력
        BoardDTO boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);

        //삭제
        boardDAO.deleteBoard(num);

        //변경 후 데이터 출력
        boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO);
    }



}
