package dto;

public class CommentDto {
    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getBoardIdx() {
        return boardIdx;
    }

    public void setBoardIdx(int boardIdx) {
        this.boardIdx = boardIdx;
    }

    public String getCommentContents() {
        return commentContents;
    }

    public void setCommentContents(String commentContents) {
        this.commentContents = commentContents;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

    public String getDeleted_yn() {
        return deleted_yn;
    }

    public void setDeleted_yn(String deleted_yn) {
        this.deleted_yn = deleted_yn;
    }

    private int idx;
    private String userId;
    private int boardIdx;
    private String commentContents;
    private String commentDate;
    private String deleted_yn;
}
