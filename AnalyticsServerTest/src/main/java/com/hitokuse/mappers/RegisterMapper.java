package com.hitokuse.mappers;

import com.hitokuse.domains.RegisterVo;

public interface RegisterMapper {
	public int checkRegister(RegisterVo vo) throws Exception;
	public void insertRegister(RegisterVo vo) throws Exception;
}
