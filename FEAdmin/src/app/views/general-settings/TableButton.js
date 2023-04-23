import React from 'react';
import { Tooltip } from 'antd';
import { DeleteFilled, EditFilled, EyeFilled, InfoCircleFilled } from '@ant-design/icons';

// update: (method = 0), deleted: 1, info: 2, view: 3
export const ActionButton = ({ item, onSelect, info, view, deleted, update }) => {
    return (
        <div style={{ display: 'flex', gap: '10px', alignItems: 'center' }}>
            {update && (
                <Tooltip placement="bottom" title="chỉnh sửa">
                    <EditFilled onClick={() => onSelect(item, 0)} style={{ color: '#0d4ca5', fontSize: '16px' }} />
                </Tooltip>
            )}

            {deleted && (
                <Tooltip placement="bottom" title="xóa">
                    <DeleteFilled style={{ color: 'red', fontSize: '16px' }} onClick={() => onSelect(item, 1)} />
                </Tooltip>
            )}

            {info && (
                <Tooltip placement="bottom" title="warning record">
                    <InfoCircleFilled
                        onClick={() => onSelect(item, 2)}
                        style={{ color: '#0d4ca5', fontSize: '16px' }}
                    />
                </Tooltip>
            )}

            {view && (
                <Tooltip placement="bottom" title="view record">
                    <EyeFilled
                        style={{ color: 'rgb(40, 153, 40)', fontSize: '18px' }}
                        onClick={() => onSelect(item, 3)}
                    />
                </Tooltip>
            )}
        </div>
    );
};
