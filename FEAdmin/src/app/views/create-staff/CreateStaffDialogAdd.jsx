import React, { useEffect } from "react"
import { Button, Form, Input, Modal, Row, Col } from 'antd';
import { addTour, updateTour } from "./CreateStaffService";
import { toast } from "react-toastify";

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 3,
    closeOnClick: true
});

const CreateStaffDialogAdd = (props) => {

    const { open, onCancel, item } = props
    const [form] = Form.useForm()

    const submitForm = async (values) => {

        if (item) {
            const res = await updateTour(item.id, values)
            if (res.status === 200) {
                toast.success("Sua thanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        } else {
            const res = await addTour(values)
            if (res.status === 200) {
                toast.success("Them hanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        }
        form.resetFields()
        onCancel()
    }

    useEffect(() => {
        if (item) {
            form.setFieldsValue(item)
        }
    }, [])

    return (
        <Modal
            title="Them Tour"
            open={open}
            width={1000}
            style={{ height: 700 }}
            // onOk={handleOk} 
            onCancel={onCancel}
            footer={null}
        >
            <Form
                form={form}
                onFinish={submitForm}
                layout="vertical"
            >
                <Row gutter={[16, 16]}>
                    <Col span={18}>
                        <Form.Item
                            name="tenTour"
                            label="Ten tour"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 10,
                                    message: "Ten tour phai it nhat 10 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="phuongTien"
                            label="Phuong tien"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 2,
                                    message: "Ten tour phai it nhat 2 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z\s]+$/,
                                    message: "Không được có ký tự đặc biệt và số"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="sltd"
                            label="So luong tour"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So luong > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="xuatPhat"
                            label="Xuat phat"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 3,
                                    message: "Ten tour phai it nhat 5 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="soNgay"
                            label="So ngay"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So ngay > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="soDem"
                            label="So dem"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So dem > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="giaNguoiLon"
                            label="Gia nguoi lon"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "Gia > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="giaTreEm"
                            label="Gia tre em"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "Gia > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="giaTreNho"
                            label="Gia tre nho"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "Gia > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={18}>
                        <Form.Item
                            name="lichTrinh"
                            label="Lich trinh"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 10,
                                    message: "Ten tour phai it nhat 10 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="moTaTour"
                            label="Mo ta tour"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 10,
                                    message: "Ten tour phai it nhat 10 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>

                <Row justify={"center"}>
                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Row>
            </Form>
        </Modal>
    )
}

export default CreateStaffDialogAdd
