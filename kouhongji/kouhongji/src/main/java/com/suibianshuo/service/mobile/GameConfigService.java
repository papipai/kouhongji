package com.suibianshuo.service.mobile;

import java.util.List;

import com.suibianshuo.entity.mobile.GameConfig;

public interface GameConfigService {  
	/**
	 * 查询
	 * @return
	 */
	public List<GameConfig> getGameConfig(GameConfig gameConfig);
	/**
	 * 新增
	 * @param user
	 * @return
	 */
	public int addGameConfig(GameConfig gameConfig);
	/**
	 * 更新
	 * @param user
	 * @return
	 */
	public int updateGameConfig(GameConfig gameConfig);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int deleteGameConfig(int id);
}  
